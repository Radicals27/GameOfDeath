def fight(player, location, enemies)
    for e in enemies
        if e.location == player.location
            opponent = e
        end
    end

    slow_print(location_descriptions(player.location))
    puts "\n#{player.name} is attacking #{opponent.name}...".red

    while player.is_able_to_fight and opponent.is_able_to_fight
        attack_selection = nil
        target_selection = nil

        while attack_selection != "p" and attack_selection != "k"
            puts "Make a choice:"
            case player.get_combat_options
            when "pk"
                puts "(p)unch or (k)ick"
            when "p"
                puts "(p)unch"
            when "k"
                puts "(k)ick"
            when false
                puts "(r)oll away! (You have no usable limbs!)"
            end
            attack_selection = gets.chomp
        end
        
        while !input_checker(["p", "k"], attack_selection)
            puts "invalid, try again:"
            attack_selection = gets.chomp
        end

        if attack_selection == "p"
            damage = rand(5..10) + (higher(player.limbs["ra"][1], player.limbs["la"][1]))/10
        elsif attack_selection == "k"
            damage = rand(8..15) + (higher(player.limbs["rl"][1], player.limbs["ll"][1]))/10
        end
        system "clear"
        display_stats(player)
        puts "Where would you like to target?"
        puts "(h)ead (ra)right arm (la)left arm (ll)left leg (rl)right leg (g)roin (t)orso (h)ead"
        target_selection = gets.chomp
        while !input_checker(["h", "ra", "la", "ll", "rl", "g", "t", "h"], target_selection)
            puts "invalid, try again:"
            target_selection = gets.chomp
        end

        if player.attack_has_hit(attack_selection)
            opponent.take_damage(target_selection, damage)
            system "clear"
            display_stats(player)
            puts "#{opponent.name} took #{damage} damage to the #{opponent.limbs[target_selection][0]}".red
            if opponent.limbs[target_selection][1] <= 0
                puts damage_message(opponent.limbs[target_selection][0])
            end
        else
            system "clear"
            display_stats(player)
            puts "you missed!".yellow
            print "#{opponent.name}: "
            slow_print(taunts)
            print "\n"
        end
        
        #Now opponent attacks player...
        if opponent.is_able_to_fight
            target_selection = player.get_random_limb

            if opponent.prefers_attack == "p"
                puts "#{opponent.name} tries to punch you in your #{target_selection}"
                attack_selection = "p"
            elsif opponent.prefers_attack == "k"
                puts "#{opponent.name} tries to kick you in your #{target_selection[0]}"
                attack_selection = "k"
            else
                rand(1..2) == 1 ? attack_selection = "p" : attack_selection = "k"
                puts "#{opponent.name} tries to #{attack_selection == "p" ? "punch" : "kick"} you in your #{target_selection[0]}"
            end
            
            if opponent.attack_has_hit(attack_selection)
                if attack_selection == "p"
                    damage = rand(5..10) + (higher(opponent.limbs["ra"][1], opponent.limbs["la"][1]))/10
                    player.take_damage(player.limbs.key(target_selection), damage)
                elsif attack_selection == "k"
                    damage = rand(8..15) + (higher(opponent.limbs["rl"][1], opponent.limbs["ll"][1]))/10
                    player.take_damage(player.limbs.key(target_selection), damage)
                end
                puts "#{opponent.name} hits you in the #{target_selection[0]} for #{damage} damage".red
            else
                puts "...And misses.".yellow
            end
        else
            puts "#{opponent.name} is too damaged to continue!\nYou win!".green
            player.location += 1
        end
    end
    if !player.is_able_to_fight
        puts "You are too damaged to continue!".red
        slow_print("GAME OVER!")
    end
end

def slow_print(string)
    string.each_char {|c| putc c ; sleep 0.05}
end

def damage_message(limb)
    description = [
        "The #{limb} is hanging by a single piece of skin.",
        "The #{limb} is destroyed beyond recognition.",
        "#{limb}?  What #{limb}? It is no longer recognisable!",
        "The #{limb} is beaten to a pulp",
        "#{limb}'s are not supposed to look like *that*",
        "The #{limb} looks like a sock full of mince.",
        "The #{limb} has been knocked clean off!"
    ]
    return description.sample
end

def display_stats(person)
    stats_to_display = [
        person.limbs["h"], person.limbs["t"], person.limbs["g"], person.limbs["ra"], 
        person.limbs["la"], person.limbs["ll"], person.limbs["rl"]
    ]
    output = ""

    for stat in stats_to_display
        if stat[1] <= 10
             print "#{stat[0]}:"
             print "#{stat[1]} // ".yellow
        elsif stat[1] <= 0
            print "#{stat[0]}:"
            print "CRIPPLED // ".red
        else
            print "#{stat[0]}:#{stat[1]} // "
        end
    end
    print "\n"
    STDOUT.flush
end

def input_checker(valid_inputs, input)
    for i in valid_inputs
        if i == input
            return true
        end
    end
    return false
end

def higher(var1, var2)   #Returns whichever variable is higher
    if var1 > var2 
        return var1 
    else
        return var2
    end
end