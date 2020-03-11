# Game of Death

## Table of Contents
* [Referenced material](#Referenced-material)
* [Repository](#Repository)
* [Purpose and Scope](#Purpose-&-Scope)
* [Features](#Features)
* [Outline](#Outline)
* [Gameplay Loop](#Gameplay-Loop)
* [Implementation Plan](#Implementation-Plan)
* [Help](#Help)

## Referenced Material
For character names and story background:
https://en.wikipedia.org/wiki/Game_of_Death



## Repository:
https://github.com/Radicals27/game_of_death

## Purpose & Scope
'Game of Death' is a text-based adventure/combat game made in Ruby, based on the Bruce Lee movie by the same name.  It is designed to be an interactive story which allows the player to engage in text-based combat with various enemies.  Each enemy has a unique personality who will engage with the player.

The aim of the game will be to reach the 5th and final level and defeat the last opponent there.
There will be no guarantee that the player will make it that far as the enemies are challenging in their own ways.

This game aims to solve the problem of making a text-based game with limited graphical capabilities that is still engaging, captivating and fun for a wide range of players.  It will do this through humour, colour and randomised enemy behaviours to provide a stimulating and unpredictable experience.

It is targeted towards people aged 15 and up who enjoy computer games, as it does contain some violence and adult themes.

To use the program, a player simply runs the game_of_death.rb file and follows the user-friendly prompts. The inputs are limited to one or two characters at a time and any input errors are handled and displayed to the user immediately. A typical game lasts about 5 minutes, but can be completed as quickly as 2 minutes if so desired.

This project was completed as Assignment 1 for the Fast-track program at Coder Academy in March 2020.  During development, the developer aimed to use D.R.Y (Don't repeat yourself) principles while coding, and to create sufficient documentation both inside the code (comments), within the program (prompts), and alongside it (Readme.md).

## Features
* Text-based interactive combat system.
* A comprehensive damage system allowing players and enemies to target specific body parts with unique consequences (having 2 damaged arms means you can no longer punch, for example.)
* Unique battles with unique characters; Each enemy has their own personality and quotes/taunts as well as weaknesses and strengths for the player to discover and exploit.

## Outline

From the start of the game, the user will be prompted with their options via keys they can press (expressed by parenthesis surrounding a given key; (p) for the "p" button, for instance).  At any given moment if there is not a prompt there will be text printing to the screen which the user needs to read.

When the user is prompted, they simply need to press one of the prompted keys then press enter.  This choice then goes into the game and the consequences are displayed.

Any errors that are encountered, such as invalid user input, will prompt the user to enter a valid input, until they do.

## Gameplay loop
Please refer to the UML diagram (linked below) for a visual representation of the gameplay loop.

https://github.com/Radicals27/game_of_death/blob/master/Game%20of%20Death.png

## Implementation Plan

### Combat System
For the text-based combat system, it was decided after careful consideration that classes would be an ideal method to implement such an idea.  Classes allow tracking of instance variables or attributes, such as "health" and "accuracy", as well as functions, such as those involved in calculating damage and whether or not an attack has hit an opponent.  Both the player and the enemies could be represented this way to minimise code and maintain D.R.Y standards.  An enemy-specific class would be ideal, that inherits from the "Human" class, so that enemy specific actions such as speaking, could take place.

Once the UML flow chart was completed, it became clear that a seperate method for fighting (between player and a given enemy) and an initial "main" method would be necessary to hold all of the contents.

As dialogue would play a large part in the games functionality, arrays were needed to store the various dialogues that enemies could speak.  It was decided to store these in methods which would return either a random sample, or elements from a sub-array in the case of enemy-specific dialogue. (dialogue[3][element] for the 3rd enemies dialogue element, for example.)

Methods, classes and data (dialogue and verbose location descriptions) would be split into their own ruby (.rb) files.  The main program, containing the main method (and its initial call), as well as the "require" codes and class initialisations, would be placed in the game_of_death.rb file.

External gems were included to add to the game to add flair and improved visuals. These include colorize and tty-font.  Tty-font allows printing of large text using ASCII characters for the title screen.  Colorize allows printing some text in red, yellow and green for negative events (damage taken), low health and positive events (enemy defeated) respectively.

#### Checklist:
- Set up Human class, with Enemy class which inherits from Human
- Create a hash to store Limbs and their health values
- Create class methods for taking damage, checking if an attack has hit and checking if an enemy can still fight
- Create dialogue and location method to return pre-written spoken dialogue and location descriptions
- Install bundler and create Gem file with necessary Gem references


### Damage System

The handling of damage will occur between class/instance variables and methods.  For example, when the player selects to attack an enemy with a punch and chooses to target their right arm, the "take_damage" method writes to the recipients "@limbs" hash, finds the matching targeted limb, and subtracts the final "damage" amount from its stored value.

If enough damage is done to the recipients limb, it becomes crippled and cannot be used.  2 crippled arms means the person cannot punch, 2 crippled legs means they cannot kick, a crippled head severely affects accuracy, and other limbs have no effect.  Each unit of damage that is done to a limb also reduces the person's health.  When their health is 0, they are defeated.  Or if their randomised "weakness" (a randomly selected limb) is crippled, they are also defeated.

#### Checklist:
- Create fight() method, which takes a player and enemy object
- Incorporate checks for player and enemy's ability to fight (0 health?) and handle both outcomes

### Unique battles with Unique characters
The game aims to have a comical feel, with verbose opponents who taunt and poke fun at the player when he misses attacks.  Sometimes opponents will even reveal their weaknesses, so it pays to pay attention.  When an enemy speaks, it is randomly selected from an array, so each battle is slightly different.  A player hopefully feels encouraged to play the game through multiple times to discover each piece of dialogue.

#### Checklist:
- Write detailed, witty dialogues for the opponents
- Write at least 6 dialogue options for each opponent in combat

Please refer to the Trello Board (linked below) for the implementation plan:

- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

ADD TRELLO HERE!!!!!!

## Help

ADD HELP DOCUMENTATION HERE!!!!
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements

```ruby
class Human
    def initialize(toughness, health)
    end
end
```
# !! DONT FORGET TO PACKAGE IT (R19 criteria) into a .SH script!

#Final deliverable:
/docs/<documentation>, readme.md, help file, etc ALL LINKS TO ONLINE MATERIAL MUST HAVE SCREENSHOTS!!>
/ppt/<presentation>
/src/<source code, does not need to include .git/ folder>


### As you can see from the above code, it will be a fun game.
---


![Bruce Lee](https://thediplomat.com/wp-content/uploads/2013/12/sizes/medium/yellowjumpsuit_edited.jpg)