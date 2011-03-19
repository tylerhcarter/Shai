module PlayerCommands

    # Self Info
    def show_info
      puts "Total Money $"+@money.total.to_s
    end

    def show_own_house_info
      puts "Building Type: " + @house.class.to_s
      puts "Owner: " + @house.owner if @house.respond_to? :owner
      puts "Contains: $" + @house.money.total.to_s
    end

    # Current Info
    def show_building_info building
      puts "Building Type: " + building.class.to_s
      puts "Owner: " + building.owner if building.respond_to? :owner
      puts "Contains: $" + building.money.total.to_s
      if building.respond_to? :isLocked?
        puts "Locked" if building.isLocked?
      end
    end

end
