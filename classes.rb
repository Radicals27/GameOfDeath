class Human
    attr_accessor :name, :health, :strength, :toughness, :location,  :limbs, :is_able_to_fight
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
    def attack_has_hit(attack_type)
        if attack_type == "p"
            if rand(1..100) < @accuracy
                return true   #punch did hit
            end
        elsif attack_type == "k"
            if (rand(1..100)+15) < @accuracy
                return true   #kick did hit
            end
        end
        return false   #did not hit
    end

    def take_damage(body_part, damage)
        if body_part == @limbs.key(@weakness)
            @limbs[body_part][1] -= damage*1.5
        else
            @limbs[body_part][1] -= damage
        end
        @is_able_to_fight = check_ability_to_fight
    end

    def check_ability_to_fight
        if @limbs["h"][1] <= 0 or @limbs["t"][1] <= 0 or @limbs["g"][1] <= 0
            return false   #head, torso or groin are destroyed
        elsif @limbs["ra"][1] <= 0 and @limbs["la"][1] <= 0 and @limbs["rl"][1] <= 0 and @limbs["ll"][1] <= 0 
            return false   #all 4 limbs are destroyed
        elsif self.class.to_s == "Enemy"
            if @weakness[1] <= 0
                return false
            end
        end
        return true
    end
end

class Enemy < Human
    attr_reader :weakness, :prefers_attack

    def initialize(name, health, strength, accuracy, location=false, prefers_attack=false)
        super
        @prefers_attack = prefers_attack
        @weakness = self.get_random_limb
    end
    def attack_player
        if @prefers_attack == false
            rand(1..2) == 1 ? attack_type = "p": attack_type = "k"
        end
        puts "#{@name} attacks you..."
    end
    def talk(struck_limb)
        return "#{@name}: #{speak(@location-1, struck_limb, @weakness[0])}"
    end
end