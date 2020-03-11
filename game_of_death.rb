# Desired features: 
#Updates player stats bar upon game over so player can see final damaged limb/s
#Doesn't repeat opponent sayings/taunts
#Add secret (cheat) attack - (g)un?

require "rubygems"
require "bundler/setup"
require "colorize"
require "tty-font"
require "pastel"
require_relative "classes.rb"
require_relative "methods.rb"
require_relative "data.rb"

def main    
    system "clear"

    #Present welcome screen
    pastel = Pastel.new
    font = TTY::Font.new(:doom)
    puts pastel.yellow(font.write("Game of Death!"))
    pause("Press enter to continue...")

    system "clear"

    #Setup initial objects
    game_over = false

    new_player = Human.new("Bruce", 100, 80, 1)      
    enemy_1 = Enemy.new("Hwang", 25, 60, 1, "kick")
    enemy_2 = Enemy.new("Taky", 30, 65, 2, "punch")
    enemy_3 = Enemy.new("Dan", 35, 70, 3)
    enemy_4 = Enemy.new("Ji", 40, 75, 4, "punch")
    enemy_5 = Enemy.new("Kareem", 45, 85, 5)
    enemies = [enemy_1, enemy_2, enemy_3, enemy_4, enemy_5]

    slow_print(location_descriptions(0), 0.05)
    location = 1

    while !game_over        
        fight(new_player, location, enemies)
        location += 1
        #If the player is not able to fight, then it's game over
        if !new_player.is_able_to_fight
            game_over = true
            puts "You are too damaged to continue!".red
            slow_print("GAME OVER!", 0.5)
        #But if only the final boss can't fight, then the player has won (game over)
        elsif !enemy_5.is_able_to_fight
            game_over = true
            slow_print("You have defeated all 5 bosses!", 0.05)
            slow_print("You realise that there are more important things in life than fighting.", 0.05)
            slow_print("You go home with Linda and live happily ever after...", 0.05)
            slow_print("THE END!", 0.5)
        end
    end
    puts "\n"
end

#Start the game by calling main()
main