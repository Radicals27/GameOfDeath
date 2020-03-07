def fight(player, opponent)
    attack_selection = false
    target_selection = false
    puts "#{player.name} is attacking #{opponent.name} in area #{@location}"

    while opponent.is_able_to_fight == true
        "Make a choice:"
        case player.get_combat_options
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
        if opponent.prefers_attack == "p"
            puts "#{opponent.name} tries to punch you in your #{player.get_random_limb}"
        elsif opponent.prefers_attack == "k"
            puts "#{opponent.name} tries to kick you in your #{player.get_random_limb}"
        else
            rand(1..2) == 1 ? attack_selection = "p" : attack_selection = "k"
            puts "#{opponent.name} tries to attack you in your #{player.get_random_limb}"
        end
    end
    puts "#{opponent.name} is too damaged to continue! \n You win!"
    
end

def higher(var1, var2)   #Returns whichever variable is higher
    if var1 > var2 
        return var1 
    else
        return var2
    end
end