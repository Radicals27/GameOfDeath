#Descriptions of the beginning plus each of the 5 locations
def location_descriptions(index)
    descriptions = [
        "Your girlfriend, Linda, has been kidnapped! The local mafia are keeping her in the top level of the mysterious pagoda on the outskirts of town...",
        "You step inside, the room is a dojo of some sort, there is a man meditating.  He hears you enter and approaches you with anger in his eyes, get ready!",
        "You catch your breath and head upstairs.  It's a dark room with a single chair, where another angry man is sitting.  He gets up and screams as he lunges at you!",
        "Exhausted, you continue upstairs.  Into an even darker room with an even angrier, louder man, get ready!",
        "You crawl upstairs.  There is no one here and you are safe.  Just kidding, you are being attacked!",
        "You have reached the top floor! Your girlfriend is playing Monopoly with Kareem, the mafia boss.  He attacks you!",
    ]
    return descriptions[index]
end

#Enemy taunts, said when you miss
def taunts
    taunts = [
        "You fight as well as you smell!  Which is to say, bad!",
        "You suck!",
        "No pain, no gain!",
        "Linda is ours now! Get over it!",
        "You are a bad person!",
        "Get out! This is our pagoda!",
        "You're from that place I don't like!",
        "I trained for years just to kick your butt!",
        "If you were a better boyfriend, you wouldn't be in this situation!",
        "You look like a weakling! Oh! It's because you are!",
        "Hahahah you missed!",
        "Missed me again!",
        "You can't even hit me!",
    ]
    return taunts[rand(0..taunts.length()-1)]
end

#Things enemies will say when you hit them
def speak(index, struck_limb, weak_limb)
    dialogues = [
        ["OW!", "Ow! My #{struck_limb}!", "Don't hit my #{weak_limb}, please!", "I hope you don't hit my weak #{weak_limb}!!"],
        ["Oof!", "I'm removing you from Facebook...", "Why'd you have to hit my #{struck_limb}??", "Whatever you do don't hit my #{weak_limb}!"],
        ["Oh my God that smarts!", "If I put on my glasses would you stop hitting me?", "I'm a bleeder!"],
        ["*cries*", "What did my #{struck_limb} ever do to you?", "My God you're strong! I see why your girlfriend likes you.", "I think we went to the same school!"],
        ["OW! I should've become a programmer...", "I won't let my family down!", "I was about to pass GO, too!", "I feel lighter without my #{struck_limb}","I don't need my #{struck_limb} anyway!"],
    ]
    return dialogues[index][rand(0..dialogues[index].length-1)]
end

#Message player will receive when he cripples an enemies limb
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