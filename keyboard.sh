setxkbmap -option grp:alt_shift_toggle -option caps:ctrl_modifier -layout us,se,rs -variant ",,latin"
# setxkbmap -option grp:alt_shift_toggle -option ctrl:nocaps -layout us,se,rs -variant ",,latin"
# xcape -e 'Caps_Lock=Escape' -t 300
killall xcape
xcape -e 'Control_L=Escape'
# -t 100
# xmodmap -e 'remove Mod1 = Alt_R'
# xmodmap -e 'add Mod3 = Alt_R'

# setxkbmap -option grp:alt_shift_toggle -option ctrl:nocaps us,se,rs

