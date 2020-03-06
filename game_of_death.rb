class Human
    attr_accessor :health, :strength, :toughness, :location
    def initialize(name, health, strength, toughness, location=false)
        @name = name
        @health = health
        @strength = strength
        @toughness = toughness
        @location = location

        @left_arm = 25
        @right_arm = 25
        @left_leg = 30
        @right_leg = 30
        @groin = 25
        @torso = 50
        @head = 25
    end
    def get_combat_options
        if @left_arm > 0 or @right_arm > 0
            if @left_leg > 0 or @right_leg > 0
                return "pk"   #can punch and kick
            else
                return "p"   #can only punch
            end
        else
            return false   #no limbs!
        end
    end
    def name
        return @name
    end
    def health
        return @health
    end
    def strength
        return @strength
    end
    def toughness
        return @toughness
    end
    def location
        return @location
    end
    
end

class Player < Human
    def fight(opponent)
        selection = false
        fighting = true
        puts "#{@name} is attacking #{opponent.name} in #{@location}"

        while fighting
            "Make a choice:"
            case self.get_combat_options
            when "pk"
                puts "(p)unch or (k)ick"
            when "p"
                puts "(p)unch"
            when "k"
                puts "(k)ick"
            when false
                puts "(r)oll away! (You have no usable limbs!)"
            end
            selection = gets.chomp
            if selection == p then damage = @strength * higher(@left_arm, @right_arm) end
            puts "Where would you like to target?"
            puts "(h)ead"
        end
        def higher(var1, var2)
            if var1 > var2 
                return var1 
            else
                return var2
            end
        end
    end
    
end

class Enemy < Human
end

def main
    game_over = false
    while !game_over
        puts "playing game!\n"
        
        new_player = Player.new("Bruce", 100, 10, 10, 1)
        puts "#{new_player.name}'s health is #{new_player.health}"
        
        enemy_1 = Enemy.new("Dan", 40, 5, 5, 1)

        new_player.fight(enemy_1)

        game_over = true
        puts "\n"
    end
end



main