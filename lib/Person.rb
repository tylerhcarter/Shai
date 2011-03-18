require 'settings'
require 'money_storage'
require 'events'

module People
    class Person

      attr_accessor :name, :money, :house

      @name = ""
      @key = ""
      @money
      @house

      def initialize name, house, key
        @name = name

        if !house.respond_to? :lock
          raise "Person::Initalize must recieve a house as a #2 parameter"
        end

        @key = key
        house.lock

        @house = house

        @money = MoneyStorage.new name, PERSON_START_MONEY

      end

      def act building

        if !building.respond_to? :enter
          raise "Must give house to Person::Act"
        end

        # Check if it is a house
        if building.respond_to?(:unlock) && building.respond_to?(:deposit_money)

          # Deposit money if mine
          deposit_money_house building if is_mine? building

        # Check if it is a bank
        elsif building.respond_to? :deposit
          deposit_money_bank building

        end

      end

      private

      def deposit_money_house building

        # Unlock the house, add money, and lock
        building.unlock @key

        # Deposit money

        # Find out how much you have
        on_hand = @money.total

        # Pick a random number to deposit
        to_deposit = rand(on_hand + 1)

        building.deposit_money to_deposit
        @money.subtract to_deposit
        Events.deposited(@name, building.owner + "'s House", to_deposit)

        # Random chance he forgets to lock the house
        num = rand PERSON_LOCK_CHANCE
        if num > 1
          house.lock
        end

      end

      def deposit_money_bank building
        
        # Find out how much you have
        on_hand = @money.total

        # Pick a random number to deposit
        to_deposit = rand(on_hand + 1)

        building.deposit to_deposit, @name
        @money.subtract to_deposit

      end

      def retrieve_money

        @house.unlock @key
        @money.add @house.withdraw_all if @house.money.total > 0
        @house.lock

      end

      def is_mine? house

        # Check if it is a house
        if !house.respond_to? :owner
          return false
        end

        # Check if it belongs to me
        if house.owner == @name
          return true
        else
          return false
        end

      end

    end
    
  end