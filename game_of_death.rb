require "rubygems"
require "bundler/setup"
require "colorize"
require "tty-font"
require "pastel"
require_relative "classes.rb"
require_relative "methods.rb"
require_relative "data.rb"

def main
    intro = true
    while intro == true
        system "clear"
        pastel = Pastel.new
        font = TTY::Font.new(:doom)
        puts pastel.yellow(font.write("Game of Death!"))
        slow_print("Press enter to continue...")
        if gets
            intro = false
        end
    end

    system "clear"
    game_over = false
    new_player = Player.new("Bruce", 100, 10, 80, 1)      
    enemy_1 = Enemy.new("Hwang", 40, 5, 60, 1, "kick")
    enemy_2 = Enemy.new("Taky", 50, 5, 65, 2, "punch")
    enemy_3 = Enemy.new("Dan", 60, 5, 70, 3)
    enemy_4 = Enemy.new("Ji", 80, 5, 75, 4, "punch")
    enemy_5 = Enemy.new("Kareem", 100, 5, 85, 5)
    enemies = [enemy_1, enemy_2, enemy_3, enemy_4, enemy_5]

    slow_print(location_descriptions(0))
    location = 1

    while !game_over        
        fight(new_player, location, enemies)
        location += 1
        if !enemy_5.is_able_to_fight or !new_player.is_able_to_fight
            game_over = true
        end
    end
    if !enemy_5.is_able_to_fight
        slow_print("You have defeated all 5 bosses!")
        slow_print("You realise that there are more important things in life than fighting.")
        slow_print("You go home and have a very good sleep.")
        slow_print("THE END!")
    end
    puts "\n"
end

main