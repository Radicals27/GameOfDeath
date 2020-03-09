class Human
    attr_accessor :health, :strength, :toughness, :location
    def initialize(name, health, strength, accuracy, location=false, prefers_attack=false)
        @name = name
        @health = health
        @strength = strength
        @accuracy = accuracy
        @location = location
        @is_able_to_fight = true   #changes to false if certain limbs get too damaged

        @limbs = {
            "la" => ["left arm", 25],
            "ra" => ["right arm", 25],
            "ll" => ["left leg", 30],
            "rl" => ["right leg", 30],
            "h" => ["head", 25],
            "g" => ["groin", 15],
            "t" => ["torso", 50]
        }
    end
    def limbs
        return @limbs
    end
    def limb_damage(limb, damage)
        @limbs[limb][1] -= damage
    end
    def get_random_limb
        random_limb = @limbs.values.sample   #Get a random sample from the limbs hash
        return random_limb
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
            if rand(1..100) < @accuracy
                return true   #did hit
            end
        elsif attack_type == "k"
            if (rand(1..100)+15) < @accuracy
                return true   #did hit
            end
        end
        return false
    end

    def take_damage(body_part, damage)
        @limbs[body_part][1] -= damage
        @is_able_to_fight = check_ability_to_fight
    end

    def check_ability_to_fight
        if @limbs["h"][1] <= 0 or @limbs["t"][1] <= 0 or @limbs["g"][1] <= 0
            return false   #head, torso or groin are destroyed
        elsif @limbs["ra"][1] <= 0 and @limbs["la"][1] <= 0 and @limbs["rl"][1] <= 0 and @limbs["ll"][1] <= 0 
            return false   #all 4 limbs are destroyed
        end
        return true
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
end

class Enemy < Human
    def initialize(name, health, strength, accuracy, location=false, prefers_attack=false)
        super
        @prefers_attack = prefers_attack
    end
    def attack_player
        if @prefers_attack == false
            rand(1..2) == 1 ? attack_type = "p": attack_type = "k"
        end
        puts "#{@name} attacks you..."
    end
    def prefers_attack
        return @prefers_attack
    end
end
