class Human
    attr_accessor :health, :strength, :toughness, :location
    def initialize(name, health, strength, toughness, location=false)
        @name = name
        @health = health
        @strength = strength
        @toughness = toughness
        @location = location
        @is_able_to_fight = true   #changes to false if certain limbs get too damaged

        @limbs = {
            "la" => ["left arm", 25],
            "ra" => ["right arm", 25],
            "ll" => ["left leg", 30],
            "rl" => ["right leg", 30],
            "h" => ["head", 25],
            "groin" => ["groin", 15],
            "torso" => ["torso", 50]
        }

        
    end
    def get_combat_options
        if @limbs["ra"][1] > 0 or @limbs["la"][1] > 0
            if @limbs["ll"][1] > 0 or @limbs["rl"][1] > 0
                return "pk"   #can punch and kick
            else
                return "p"   #can only punch
            end
        elsif @limbs["rl"][1] > 0 or @limbs["ll"][1] > 0
            return "k" #can only kick
        else
            return false   #no limbs!
        end
    end
    def name
        return @name
    end

    def attack_has_hit(attack_type)
        if attack_type == "p"
            if rand(1..100) > 10
                return true   #did hit
            end
        elsif attack_type == "k"
            if rand(1..100) > 30
                return true   #did hit
            end
        end
        return false
    end

    def take_damage(body_part, damage)
        @limbs[body_part][1] -= damage   #does this work?
        puts "#{@limbs[body_part][0]} took #{damage} damage."
        @is_able_to_fight = check_ability_to_fight()
    end

    def check_ability_to_fight()
        if @limbs["h"][1] <= 0 or @limbs["t"][1] <= 0 or @limbs["g"][1] <= 0
            return false   #head, torso ot groin are destroyed
        elsif @limbs["ra"][1] <= 0 and @limbs["la"][1] <= 0 and @limbs["rl"][1] <= 0 and @limbs["ll"][1] <= 0 
            return false   #all 4 limbs are destroyed
        end
    end

    def is_able_to_fight
        return @is_able_to_fight
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
        puts "#{@name} is attacking #{opponent.name} in area #{@location}"

        while opponent.is_able_to_fight == true
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
            if attack_selection == "p" then damage = higher(@limbs["ra"][1], @limbs["la"][1]) end
                p "damage: #{damage}"
            puts "Where would you like to target?"
            puts "(h)ead (ra)right arm (la)left arm (ll)left leg (rl)right leg (g)roin (t)orso (h)ead"
            target_selection = gets.chomp

            if attack_has_hit(attack_selection)
                opponent.take_damage(target_selection, damage)
            else
                puts "you missed!"
            end
        end
        puts "#{opponent.name} is too damaged to continue! \n You win!"
        
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
