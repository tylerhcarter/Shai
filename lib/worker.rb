module People
  class Worker < Person
    @pay = 0

    def initialize name, house, key, pay = 100
      super name, house, key

      @pay = pay
    end

    def act house
      super house

      record = @money.add WORKER_PAY_PER_MOVE

      record.to = @name
      record.from = "world"
      Events.paid(record)

    end
  end
end
