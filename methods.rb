def fight(player, opponent)
    slow_print(location_descriptions(opponent.location))
    attack_selection = false
    target_selection = false
    puts "#{player.name} is attacking #{opponent.name}..."

    while opponent.is_able_to_fight == true
        attack_selection = nil
        
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
            p "attack selection is: #{attack_selection}"
        end
        
        if attack_selection == "p"
            damage = rand(5..10) + (higher(player.limbs["ra"][1], player.limbs["la"][1]))/10
        elsif attack_selection == "k"
            damage = rand(8..15) + (higher(player.limbs["rl"][1], player.limbs["ll"][1]))/10
        end

        puts "damage: #{damage}"
        puts "Where would you like to target?"
        puts "(h)ead (ra)right arm (la)left arm (ll)left leg (rl)right leg (g)roin (t)orso (h)ead"
        target_selection = gets.chomp

        if player.attack_has_hit(attack_selection)
            opponent.take_damage(target_selection, damage)
        else
            puts "you missed!"
        end
        
        #Now opponent attacks player...
        target_selection = player.get_random_limb

        if opponent.prefers_attack == "p"
            puts "#{opponent.name} tries to punch you in your #{target_selection}"
            attack_selection = "p"
        elsif opponent.prefers_attack == "k"
            puts "#{opponent.name} tries to kick you in your #{target_selection}"
            attack_selection = "k"
        else
            rand(1..2) == 1 ? attack_selection = "p" : attack_selection = "k"
            puts "#{opponent.name} tries to #{attack_selection == "p" ? "punch" : "kick"} you in your #{target_selection}"
        end
        
        if opponent.attack_has_hit(attack_selection)
            if attack_selection == "p"
                damage = rand(5..10) + (higher(opponent.limbs["ra"][1], opponent.limbs["la"][1]))/10
            elsif attack_selection == "k"
                damage = rand(8..15) + (higher(opponent.limbs["rl"][1], opponent.limbs["ll"][1]))/10
            end
            puts "#{opponent.name} hits you in the #{target_selection} for #{damage} damage"
        else
            puts "...And misses."    
        end
    end
    puts "#{opponent.name} is too damaged to continue! \n You win!"
    
end

def slow_print(string)
    string.each_char {|c| putc c ; sleep 0.05}
    #string.each_char {|c| putc c ; sleep 0.05; $stdout.flush }
end

def higher(var1, var2)   #Returns whichever variable is higher
    if var1 > var2 
        return var1 
    else
        return var2
    end
end