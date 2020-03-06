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
    def take_damage(body_part, damage)
        body_part -= damage   #does this work?
        p "#{body_part} took #{damage} damage."
        # case body_part
        # when @head
        #     @head -= damage
        # when @right_arm
        #     @right_arm -= damage
        # when @right_arm
        #     @right_arm -= damage
        # when @left_arm
        #     @left_arm -= damage
        # when @right_leg
        #     @right_leg -= damage
        # when @left_leg
        #     @left_leg -= damage
        # when @groin
        #     @groin -= damage
        # when @torso
        #     @torso -= damage
        # end
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
        attack_selection = false
        target_selection = false
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
            else
                "invalid input..."
            end
            attack_selection = gets.chomp
            if attack_selection == "p" then damage = @strength * higher(@left_arm, @right_arm) end
                p "damage: #{damage}"
            puts "Where would you like to target?"
            puts "(h)ead (a)rms (l)egs (g)roin (t)orso (h)ead"
            target_selection = gets.chomp

            case target_selection
            when "h"
                puts "you attack your opponents head!"
                opponent.take_damage(@head, damage)
            when "a"
                puts "you attack your opponents arms!"
            when "l"
                puts "you attack your opponents legs!"
            when "g"
                puts "you attack your opponents groin!"
            when "t"
                puts "you attack your opponents torso!"
            end
        end
        
    end
    def higher(var1, var2)
        if var1 > var2 
            return var1 
        else
            return var2
        end
    end
    
end

class Enemy < Human
end
