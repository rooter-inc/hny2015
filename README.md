# Happy New Year 2015 - New Year's Greetings From ROOTER

![](images/sheep.png)

New Year's Greetings From ROOTER.  
Sheep jumping may help you sleep well.

Enjoy!


## Demo
![](images/message.gif)

![](images/animation.gif)

## Requirements
- **Ruby**: 2.1.4+
(It may work under lower ruby versions, but there is no guarantee for them.)


## How it work
### install
Add this to your gem file:

    gem 'hny2015', github: 'rooter-inc/hny2015'

then run

    bundle install

### usage

    require "hny2015"

    hny = HNY2015.new
    hny.play

Or you can see these parts separately:

    hny.message   # show message
    hny.animation # show sheep animation


