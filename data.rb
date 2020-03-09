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

def sayings
    sayings = [
        "You fight as well as you smell!  Which is to say, bad!",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
    ]
    return sayings.sample(1)
end
