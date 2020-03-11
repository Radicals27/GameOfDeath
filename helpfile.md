## Help

### Introduction

Welcome to 'Game of Death', a short, action-adventure combat game based on the famous Bruce Lee movie from 1970's.

To get started, simply run:

```ruby
bundle install
```
To install all necessary Gems from the Gemfile, automatically

then run:

```ruby
ruby game_of_death.rb
```
To start the game.

You will be presented with the welcome screen and an introduction to what's happening in the story.

You will soon be prompted to choose either a punch or kick.  Just press "p" or "k" on your keyboard, followed by the enter key, to make your selection.


You will then be asked what body part to target on your opponent.

Pay attention to the status bar at the top of the screen!  It will give you an idea of which body parts are still healthy or weak.

### Guide to combat

Attacking different body parts/limbs has different effects.  An opponent with 2 crippled arms cannot punch.  An opponent with 2 crippled legs cannot kick.  The same goes for you, too!

Every unit of damage a persons head takes, reduces their accuracy by 1 unit.  So it is possible to reduce someone's accuracy by 25 points (25%) by reducing their head to zero health.

Attacking the groin or torso have no special effects, except in the instance of...

### Weaknesses

Each opponent comes with a randomly-selected weakness.  A limb that when struck, will take 1.5x damage.  In addition to this, if it is crippled (reduced to 0 health) you will automatically win the fight!

Opponents will sometiems reveal their weaknesses to you when they speak, so pay attention!

### Replayability

Try to get through the game with more health at the final screen than your previous attempts!  Can you find all 5 enemies weaknesses?