require "rubygems"
require "bundler/setup"
require_relative "classes.rb"
require_relative "methods.rb"

def location_descriptions(index)
    descriptions = [
        "Your girlfriend, Linda, has been kidnapped! The local mafia are keeping her in the top level of the mysterious pagoda on the outskirts of town...",
        "You step inside, the room is a dojo of some sort, there is a man meditating.  He hears you enter and approaches you with anger in his eyes, get ready!",
        "You catch your breath and head upstairs.  It's a dark room with a single chair, where another angry man is sitting.  He gets up and screams as he lunges at you!",
        "Exhausted, you continue upstairs.  Into an even darker room with an even angrier, louder man, get ready!",
        "You crawl upstairs.  There is no one here and you are safe.  Just kidding, you are being attacked!",
        "You have reached the top floor! Your girlfriend is making out with Kareem, the mafia boss.  He attacks you!",
    ]
    return descriptions[index]
end

def main
    game_over = false
    while !game_over        
        new_player = Player.new("Bruce", 100, 10, 80, 1)      
        enemy_1 = Enemy.new("Hwang", 40, 5, 60, 1, "kick")
        enemy_2 = Enemy.new("Taky", 50, 5, 65, 2, "punch")
        enemy_3 = Enemy.new("Dan", 60, 5, 70, 3)
        enemy_4 = Enemy.new("Ji", 80, 5, 75, 4, "punch")
        enemy_5 = Enemy.new("Kareem", 100, 5, 85, 5)

        system "clear"
        slow_print(location_descriptions(0))


        fight(new_player, enemy_1)
        fight(new_player, enemy_2)
        fight(new_player, enemy_3)
        fight(new_player, enemy_4)
        fight(new_player, enemy_5)

        puts "You have defeated all 5 bosses!"
        puts "You realise that there are more important things in life than fighting over women."
        puts "You go home and have a very good sleep."
        puts "THE END!"

        game_over = true
        puts "\n"
    end
end

main