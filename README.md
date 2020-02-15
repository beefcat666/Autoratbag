# Autoratbag
Automate switching profiles on libratbag supported devices


# Why?

Some people like using different profiles on their gaming mice when playing different games. In my case, I found that older games don't support extra mouse buttons, because they weren't common in olden times.

# How?

libratbag makes it possible to change the active profile on many gaming mice. These profiles can include bindings or macros that emit keystrokes on certain mouse buttons. This script changes the profile, runs your game, then changes it back when the user quits their game.

# Some assembly required.

You will need to create a second profile on your mouse that binds your extra mouse buttons to keystrokes. You can do this with [Piper](https://github.com/libratbag/piper) or in Windows with the software provided by your hardware vendor. In the case of my variant of the Logitech G502, Piper support is still a bit buggy and I had to use Logitech Gaming Software in Windows to create the profile. Your normal profile should be the first and your alternate profile the second one.

When switching profiles on Logitech mice, libratbag likes to ignore the profile default sensitivity setting and just use the lowest preset in the active profile. Find the line below and alter it to suit your situation. By default, it will  set the sensitivity to the third preset in the active profile. If you only have one sensitivity value set in your profile, you can comment or remove both instances of this line. Replace the 2 with whatever sensitivity level you want to use (preset numbers start at 0).

    ratbagctl "$(echo $device)" resolution active set 2 

Put this script somewhere that is in your $PATH (i.e. /bin). Invoke with the script name and pass the command to run your game, i.e:

    $ cd games/ut99/System
    $ autoratbag.sh ./ut-bin
    
For Steam games, set the games launch options to "autoratbag.sh %command%". This also works with Steam Play titles running in Proton.
