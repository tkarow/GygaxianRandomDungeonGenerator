﻿function Roll-D2{

    Get-Random -Minimum 1 -Maximum 3

}

function Roll-D4{

    Get-Random -Minimum 1 -Maximum 5

}

function Roll-D6{

    Get-Random -Minimum 1 -Maximum 7

}

function Roll-D8{

    Get-Random -Minimum 1 -Maximum 9

}

function Roll-D10{

    Get-Random -Minimum 1 -Maximum 11

}

function Roll-D12{

    Get-Random -Minimum 1 -Maximum 13

}

function Roll-D20{

    Get-Random -Minimum 1 -Maximum 21

}

function Roll-D100{

    Get-Random -Minimum 1 -Maximum 101

}

###################################

#TABLE I.: PERIODIC CHECK (d20)
$TableI = @{
1  = "Continue straight - check again in 60' (this table)"
2  = "Continue straight - check again in 60' (this table)"
3  = "Door (see TABLE II.)"
4  = "Door (see TABLE II.)"
5  = "Door (see TABLE II.)"
6  = "Side Passage (see TABLE III.) -check again in 30' (this table)"
7  = "Side Passage (see TABLE III.) -check again in 30' (this table)"
8  = "Side Passage (see TABLE III.) -check again in 30' (this table)"
9  = "Side Passage (see TABLE III.) -check again in 30' (this table)"
10 = "Side Passage (see TABLE III.) -check again in 30' (this table)"
11 = "Passage Turns (see TABLE IV., check width on TABLE III.)"
12 = "Passage Turns (see TABLE IV., check width on TABLE III.)"
13 = "Passage Turns (see TABLE IV., check width on TABLE III.)"
14 = "Chamber (see TABLE V.) -check 30' after leaving (this table)"
15 = "Chamber (see TABLE V.) -check 30' after leaving (this table)"
16 = "Chamber (see TABLE V.) -check 30' after leaving (this table)"
17 = "Stairs (see TABLE VI.)"
18 = "Dead End (walls left, right, and ahead can be checked for Secret Doors, see TABLE V.D., footnote)"
19 = "Trick/Trap (see TABLE VII.), passage continues- check again in 30' (this table)"
20 = "Wandering Monster, check again immediately to see what lies ahead so direction of monster's approach can be determined."
}

#TABLE II.: DOORS (d20)
#Always check width of passage (TABLE III. A.)
#Location of Door:
$TableII = @{
1  = "Left"
2  = "Left"
3  = "Left"
4  = "Left"
5  = "Left"
6  = "Left"
7  = "Right"
8  = "Right"
9  = "Right"
10 = "Right"
11 = "Right"
12 = "Right"
13 = "Ahead"
14 = "Ahead"
15 = "Ahead"
16 = "Ahead"
17 = "Ahead"
18 = "Ahead"
19 = "Ahead"
20 = "Ahead"
}

#TABLE II.: DOORS (d20)
#Always check width of passage (TABLE III. A.)
#Space Beyond Door Is:
#Check again immediately on TABLE I. unless door is straight ahead; if another door is not indicated, then ignore the result and check again 30' past the door. If a room or chamber is beyond a door, go to TABLE V.
$TableIIA = @{
1  = "Parallel passage (extends 30' in both directions.) or 1 0 ' x 10' room if door is straight ahead"
2  = "Parallel passage (extends 30' in both directions.) or 1 0 ' x 10' room if door is straight ahead"
3  = "Parallel passage (extends 30' in both directions.) or 1 0 ' x 10' room if door is straight ahead"
4  = "Parallel passage (extends 30' in both directions.) or 1 0 ' x 10' room if door is straight ahead"
5  = "Passage straight ahead"
6  = "Passage straight ahead"
7  = "Passage straight ahead"
8  = "Passage straight ahead"
9  = "Passage 45 degrees ahead/behind (the direction will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"
10 = "Passage 45 degrees behind/ahead (the direction will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"
11 = "Room (go to TABLE V.)"
12 = "Room (go to TABLE V.)"
13 = "Room (go to TABLE V.)"
14 = "Room (go to TABLE V.)"
15 = "Room (go to TABLE V.)"
16 = "Room (go to TABLE V.)"
17 = "Room (go to TABLE V.)"
18 = "Room (go to TABLE V.)"
19 = "Chamber (go to TABLE V.)"
20 = "Chamber (go to TABLE V.)"
}

#TABLE III.: SIDE PASSAGES (d20)
$TableIII = @{
1  = "left 90 degrees"
2  = "left 90 degrees"
3  = "right 90 degrees"
4  = "right 90 degrees"
5  = "left 45 degrees ahead"
6  = "right 45 degrees ahead"
7  = "left 45 degrees behind (left 135 degrees)"
8  = "right 45 degrees behind (right 135 degrees)"
9  = "left curve 45 degrees ahead"
10 = "right curve 45 degrees ahead"
11 = "passage `"T`"'s"
12 = "passage `"T`"'s"
13 = "passage `"T`"'s"
14 = "passage `"Y`"'s"
15 = "passage `"Y`"'s"
16 = "four-way intersection"
17 = "four-way intersection"
18 = "four-way intersection"
19 = "four-way intersection"
20 = "passage `"X`"s (if present passage is horizontal or vertical it forms a fifth passage into the `"X`")"
}

#TABLE III. A.: PASSAGE WIDTH (d20)
$TableIIIA = @{
1  = "10'"
2  = "10'"
3  = "10'"
4  = "10'"
5  = "10'"
6  = "10'"
7  = "10'"
8  = "10'"
9  = "10'"
10 = "10'"
11 = "10'"
12 = "10'"
13 = "20'"
14 = "20'"
15 = "20'"
16 = "20'"
17 = "30'"
18 = "5'"
19 = "SPECIAL PASSAGE (TABLE III. B. below)"
20 = "SPECIAL PASSAGE (TABLE III. B. below)"
}

#TABLE III. B.: SPECIAL PASSAGE (d20)
$TableIIIB = @{
1  = "40', columns down center"
2  = "40', columns down center"
3  = "40', columns down center"
4  = "40', columns down center"
5  = "40', double row of columns"
6  = "40', double row of columns"
7  = "40', double row of columns"
8  = "50', double raw of columns"
9  = "50', double raw of columns"
10 = "50', double raw of columns"
11 = "50', columns 10' right and left support 10' wide upper galleries 20' above (stairs up to gallery will be at end of passage (1-15) or at beginning (16-20). In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (1 1-20) of the time.)"
12 = "50', columns 10' right and left support 10' wide upper galleries 20' above (stairs up to gallery will be at end of passage (1-15) or at beginning (16-20). In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (1 1-20) of the time.)"
13 = "10' stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"
14 = "10' stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"
15 = "10' stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"
16 = "20' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"
17 = "20' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"
18 = "40' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"
19 = "60' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"
20 = "20', chasm (chasms bisect the passage. They are 150' to 200' deep. They will be bridged 50% (1-10) of the time, have a jumping place 5'-10' wide 25% (1 1-15) of the time, and be an obstacle 25% (16-20) of the time.)"
}

#TABLE IV.: TURNS (d20)
$TableIV = @{
1  = "left 90 degrees"
2  = "left 90 degrees"
3  = "left 90 degrees"
4  = "left 90 degrees"
5  = "left 90 degrees"
6  = "left 90 degrees"
7  = "left 90 degrees"
8  = "left 90 degrees"
9  = "left 45 degrees ahead"
10 = "left 45 degrees behind (left 135 degrees)"
11 = "right 90 degrees"
12 = "right 90 degrees"
13 = "right 90 degrees"
14 = "right 90 degrees"
15 = "right 90 degrees"
16 = "right 90 degrees"
17 = "right 90 degrees"
18 = "right 90 degrees"
19 = "right 45 degrees ahead"
20 = "right 45 degrees behind (right 135 degrees)"
}

#TABLE V.: CHAMBERS AND ROOMS SHAPE AND SIZE (d20)
#(Roll for Shape, Size, and Exits: then' Contents, Treasure, and how the latter i s contained, if applicable.)
$TableV = @{
1  = "Chamber Shape and Area: Square, 20'x20'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 10'x10'"
2  = "Chamber Shape and Area: Square, 20'x20'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 10'x10'"
3  = "Chamber Shape and Area: Square, 20'x20'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 20'x20'"
4  = "Chamber Shape and Area: Square, 20'x20'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 20'x20'"
5  = "Chamber Shape and Area: Square, 30'x30'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 30'x30'"
6  = "Chamber Shape and Area: Square, 30'x30'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 30'x30'"
7  = "Chamber Shape and Area: Square, 40'x40'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 40'x40'"
8  = "Chamber Shape and Area: Square, 40'x40'. . . . . . . . . . . . . . . . . . . Room Shape and Area: Square, 40'x40'"
9  = "Chamber Shape and Area: Rectangular, 20' x 30' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 10' x 20'"
10 = "Chamber Shape and Area: Rectangular, 20' x 30' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 10' x 20'"
11 = "Chamber Shape and Area: Rectangular, 20' x 30' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 20' x 30'"
12 = "Chamber Shape and Area: Rectangular, 20' x 30' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 20' x 30'"
13 = "Chamber Shape and Area: Rectangular, 20' x 30' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 20' x 30'"
14 = "Chamber Shape and Area: Rectangular, 30' x 50' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 20' x 40'"
15 = "Chamber Shape and Area: Rectangular, 30' x 50' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 20' x 40'"
16 = "Chamber Shape and Area: Rectangular, 40' x 60' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 30' x 40'"
17 = "Chamber Shape and Area: Rectangular, 40' x 60' . . . . . . . . . . . . . . . Room Shape and Area: Rectangular, 30' x 40'"
18 = "Unusual shape and size - see sub-tables below"
19 = "Unusual shape and size - see sub-tables below"
20 = "Unusual shape and size - see sub-tables below"
}

#TABLE V. A.: UNUSUAL SHAPE (Roll Separately for Size) (d20)
$TableVA = @{
1  = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"
2  = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"
3  = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"
4  = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"
5  = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"
6  = "Triangular"
7  = "Triangular"
8  = "Triangular"
9  = "Trapezoidal"
10 = "Trapezoidal"
11 = "Trapezoidal"
12 = "Odd-shaped (Draw what shape you desire or what will fit the map - it is a special shape if desired)"
13 = "Odd-shaped (Draw what shape you desire or what will fit the map - it is a special shape if desired)"
14 = "Oval"
15 = "Oval"
16 = "Hexagonal"
17 = "Hexagonal"
18 = "Octagonal"
19 = "Octagonal"
20 = "Cave"
}

#TABLE V. B.: UNUSUAL SIZE (d20)
$TableVB = @{
1  = "about 500 sq. ft."
2  = "about 500 sq. ft."
3  = "about 500 sq. ft."
4  = "about 900 sq. ft."
5  = "about 900 sq. ft."
6  = "about 900 sq. ft."
7  = "about 1,300 sq. ft."
8  = "about 1,300 sq. ft."
9  = "about 2,000 sq. ft."
10 = "about 2,000 sq. ft."
11 = "about 2,700 sq. ft."
12 = "about 2,700 sq. ft."
13 = "about 3,400 sq. ft."
14 = "about 3,400 sq. ft."
15 = "roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"
16 = "roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"
17 = "roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"
18 = "roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"
19 = "roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"
20 = "roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"
}

#TABLE V. C.: NUMBER OF EXITS (d20)
$TableVC = @{
1  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 1},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 2}
2  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 1},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 2}
3  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 1},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 2}
4  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 2},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 3}
5  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 2},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 3}
6  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 2},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 3}
7  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 3},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 4}
8  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 3},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 4}
9  = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 600;'Number of Exits' = 3},[pscustomobject]@{'Room Area Lower Limit' = 601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 4}
10 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1200;'Number of Exits' = "0 (Check once per 10' for secret doors (see TABLE V. D., footnote).)"},[pscustomobject]@{'Room Area Lower Limit' = 1201;'Room Area Upper Limit' = 1000000;'Number of Exits' = 1}
11 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1200;'Number of Exits' = "0 (Check once per 10' for secret doors (see TABLE V. D., footnote).)"},[pscustomobject]@{'Room Area Lower Limit' = 1201;'Room Area Upper Limit' = 1000000;'Number of Exits' = 1}
12 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1200;'Number of Exits' = "0 (Check once per 10' for secret doors (see TABLE V. D., footnote).)"},[pscustomobject]@{'Room Area Lower Limit' = 1201;'Room Area Upper Limit' = 1000000;'Number of Exits' = 1}
13 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1600;'Number of Exits' = "0 (Check once per 10' for secret doors (see TABLE V. D., footnote).)"},[pscustomobject]@{'Room Area Lower Limit' = 1601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 1}
14 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1600;'Number of Exits' = "0 (Check once per 10' for secret doors (see TABLE V. D., footnote).)"},[pscustomobject]@{'Room Area Lower Limit' = 1601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 1}
15 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1600;'Number of Exits' = "0 (Check once per 10' for secret doors (see TABLE V. D., footnote).)"},[pscustomobject]@{'Room Area Lower Limit' = 1601;'Room Area Upper Limit' = 1000000;'Number of Exits' = 1}
16 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1000000;'Number of Exits' = "1-4 (d4)"}
17 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1000000;'Number of Exits' = "1-4 (d4)"}
18 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1000000;'Number of Exits' = "1-4 (d4)"}
19 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1000000;'Number of Exits' = "1 - door in chamber, passage in room"}
20 = [pscustomobject]@{'Room Area Lower Limit' = 1;'Room Area Upper Limit' = 1000000;'Number of Exits' = "1 - door in chamber, passage in room"}
}
#Tom note: e.g. $TableVC.(Roll-D20) | ?{($_.'Room Area Lower Limit' -le 580) -and ($_.'Room Area Upper Limit' -ge 580)}

#TABLE V. D.: EXIT LOCATION '(d20)
#If a passage or door is indicated in a wall where the space immediately beyond the wall has already been mapped, then the exit is either a secret door (1-5) or a one-way door (6-10) or it is in the opposite direction (1 1-20).
$TableVD = @{
1  = "opposite wall"
2  = "opposite wall"
3  = "opposite wall"
4  = "opposite wall"
5  = "opposite wall"
6  = "opposite wall"
7  = "opposite wall"
8  = "left wall"
9  = "left wall"
10 = "left wall"
11 = "left wall"
12 = "left wall"
13 = "right wall"
14 = "right wall"
15 = "right wall"
16 = "right wall"
17 = "right wall"
18 = "same wall"
19 = "same wall"
20 = "same wall"
}

#TABLE V. E.: EXIT DIRECTION (d20)
$TableVE = @{
1  = "straight ahead"
2  = "straight ahead"
3  = "straight ahead"
4  = "straight ahead"
5  = "straight ahead"
6  = "straight ahead"
7  = "straight ahead"
8  = "straight ahead"
9  = "straight ahead"
10 = "straight ahead"
11 = "straight ahead"
12 = "straight ahead"
13 = "straight ahead"
14 = "straight ahead"
15 = "straight ahead"
16 = "straight ahead"
17 = "45 degrees left/right (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"
18 = "45 degrees left/right (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"
19 = "45 degrees right/left (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"
20 = "45 degrees right/left (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"
}

#TABLE V. F.: CHAMBER OR ROOM CONTENTS (d20)
$TableVF = @{
1  = "Empty"
2  = "Empty"
3  = "Empty"
4  = "Empty"
5  = "Empty"
6  = "Empty"
7  = "Empty"
8  = "Empty"
9  = "Empty"
10 = "Empty"
11 = "Empty"
12 = "Empty"
13 = "Monster only (determine on appropriate table from APPENDIX C RANDOM MONSTER ENCOUNTERS, Dungeon Encounter Matrix)."
14 = "Monster only (determine on appropriate table from APPENDIX C RANDOM MONSTER ENCOUNTERS, Dungeon Encounter Matrix)."
15 = "Monster and treasure (see TABLE V.G. below)"
16 = "Monster and treasure (see TABLE V.G. below)"
17 = "Monster and treasure (see TABLE V.G. below)"
18 = "Special (Determine by balance of level or put in what you desire; otherwise put in stairs as indicated), or contains stairway up 1 level (1-5), up 2 levels (7-E), down 1 level (9-14), down 2 levels (15-19), or down 3 levels- 2 flights of stairs and a slanting passageway (20)."
19 = "Trick/Trap (see TABLE VII.)"
20 = "Treasure (see TABLE V.G.)"
}

#TABLE V. G.: TREASURE* (d%)
#*See also TABLES V. H. and I. or J.
$TableVG = @(
[pscustomobject]@{Min=1;Max=25;NoMonster='1,000 copper pieces/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=26;Max=50;NoMonster='1,000 silver pieces/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=51;Max=65;NoMonster='750 electrum pieces/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=66;Max=80;NoMonster='250 gold pieces/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=81;Max=90;NoMonster='100 platinum pieces/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=91;Max=94;NoMonster='1-4 gems/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=95;Max=97;NoMonster='1 piece jewelry/level';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min=98;Max=100;NoMonster='Magic (roll once on Magic Items Table)';WMonster='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
)
#Tom note: ($TableVG | ?{$_.min -le 89} | ?{$_.max -ge 89}).nomonster
#Tom note: ($TableVG | ?{($_.min -le 89) -and ($_.max -ge 89)}).nomonster

#TABLE V. H.: TREASURE IS CONTAINED IN* (d20)
#*Go to TABLE V. I. on a roll of 1-8, TABLE V. J. on a 9-20 to determine protection if desired.
$TableVH = @{
1  = "Bags"
2  = "Bags"
3  = "Sacks"
4  = "Sacks"
5  = "Small Coffers"
6  = "Small Coffers"
7  = "Chests"
8  = "Chests"
9  = "Huge Chests"
10 = "Huge Chests"
11 = "Pottery Jars"
12 = "Pottery Jars"
13 = "Metal Urns"
14 = "Metal Urns"
15 = "Stone Containers"
16 = "Stone Containers"
17 = "Iron Trunks"
18 = "Iron Trunks"
19 = "Loose"
20 = "Loose"
}

#TABLE V. I.: TREASURE IS GUARDED BY (d20)
$TableVI = @{
1  = "Contact poison on container"
2  = "Contact poison on container"
3  = "Contact poison on treasure"
4  = "Contact poison on treasure"
5  = "Poisoned needles in lock"
6  = "Poisoned needles in lock"
7  = "Poisoned needles in handles"
8  = "Spring darts firing from front of container"
9  = "Spring darts firing up from top of container"
10 = "Spring darts firing up from inside bottom of container"
11 = "Blade scything across inside"
12 = "Blade scything across inside"
13 = "Poisonous insects or reptiles living inside container"
14 = "Gas released by opening container"
15 = "Trapdoor opening in front of container"
16 = "Trapdoor opening 6' in front of container"
17 = "Stone block dropping in front of the container"
18 = "Spears released from walls when container opened"
19 = "Explosive runes"
20 = "Symbol"
}

#TABLE V. J.: TREASURE IS HIDDEN BYAN (d20)
$TableVJ = @{
1  = "Invisibility"
2  = "Invisibility"
3  = "Invisibility"
4  = "Illusion (to change or hide appearance)"
5  = "Illusion (to change or hide appearance)"
6  = "Secret space under container"
7  = "Secret compartment in container"
8  = "Secret compartment in container"
9  = "Inside ordinary item in plain view"
10 = "Disguised to appear as something else"
11 = "Under a heap of trash/dung"
12 = "Under a loose stone in the floor"
13 = "Under a loose stone in the floor"
14 = "Behind a loose stone in the wall"
15 = "Behind a loose stone in the wall"
16 = "In a secret room nearby"
17 = "In a secret room nearby"
18 = "In a secret room nearby"
19 = "In a secret room nearby"
20 = "In a secret room nearby"
}

###################################

<#
@{
1  = ""
2  = ""
3  = ""
4  = ""
5  = ""
6  = ""
7  = ""
8  = ""
9  = ""
10 = ""
11 = ""
12 = ""
13 = ""
14 = ""
15 = ""
16 = ""
17 = ""
18 = ""
19 = ""
20 = ""
}
#>

<#
Delta's D&D Hotspot
http://deltasdnd.blogspot.com/2010/08/

2010-08-06
http://deltasdnd.blogspot.com/2010/08/dmg-appendix.html
1. To start with, you should normally begin by going directly to a random room on Table V. (The "Start Areas" on p. 169 are visually arresting, but that's actually a secondary, optional start possibility. You don't want to re-use those a lot.)
2. The tables probably generate more 45-degree passages and 20'-wide corridors than Gygax himself would actually use by default. Be ready to ignore or override those results a lot if they don't fit well into your map; in particular, I make all 45-degree passages automatically 10' wide (ignoring the fact -- as Gygax did -- that running along vertices on the graph paper, they're really just 7' wide).
3. Rooms and Chambers (square/rectangular) should, for convenience, always be set up on the cardinal axes -- if accessed off a 45-degree passage, you should probably automatically make them Triangular or Trapezoidal. In addition, all Triangular/Trapezoidal rooms may as well be right-angled, setting them along the grid axes, and giving them a single 45-degree diagonal wall. Any side passage or "door ahead" in a 45-degree corridor should be set along a cardinal-direction, unless it explicitly states the angle at which it should be.
4. By default, Rooms should have Doors, and Chambers should have Passages (i.e., non-door openings) as exits. This isn't explicitly stated anywhere, but it's implied in places like Table I (corridors empty into chambers but never rooms), Table II (doors open to rooms 4 times more often than chambers), and Table V-C (result of 19-20 indicates exceptional case of "door in chamber, passage in room"). 
5. Note that the treasure containment tables (Tables V-H through V-J) are copied verbatim from the earlier Monster & Treasure Assortment product. Tables V-I and V-J (guarded by/hidden in) stand out in Appendix A because they don't have any game statistics associated with the entries. Particularly for solo play, I recommend ignoring these tables (per the "if desired" note -- contrast to Table VII: Trick/Trap, etc.) 
6. Also, when making Rooms/Chambers for solo play, I change the generation order to (i) Room shape/size on Table V, (ii) Contents on Table V-F, and last (iii) Exits on Table V-C, etc. This lets any fight be played out before consideration of egress, which cognitively feels better to me (e.g., see the recent discussion on when room size/detail description is appropriate).
7. Note the somewhat unusual secret-door detection rates (by d20) on Table VII, result 1-5. I use this for all indicated secret door checks in Appendix A.
8. Finally, I delete the entry on Table III for "passage X's", since I don't like how it treats cardinal-versus-diagonal passages asymmetrically (i.e., biased towards yet more diagonal passages).

2010-08-04
http://deltasdnd.blogspot.com/2010/08/dungeon-geomorphs.html
1. Basic Dungeon. The first thing that strikes me here is that almost the entirety of each map page is covered with accessible rooms -- there is almost no "dark space" of solid rock to speak of. (Module B1, 1st level is the only other dungeon product that looks similar to me.) While it's easy to get lost here, the overall sense is one of "openness", of being able to access every part of the map with some effort. There are lots of rooms here (estimate: 35 rooms and 20 passages per map section).
2. Caves and Caverns. As to be expected, these levels have irregular, rough-hewn tunnels and cave systems. There's a lot more dark space, as adjacent areas are almost always separated by at least 10' of rock (instead of thin one-line walls like in the Basic Dungeon). Caves tend to be larger than the rooms elsewhere, and unlike the other sets, there are no doors anywhere. Due to the larger sized caves, there are far fewer of them per page (estimate: 6 caves and 20 tunnels per section).
3. Lower Dungeons. The lower dungeons have more of a "claustrophobic" feel to them. There's more dark space than in the Basic Dungeon (a balance between thin-line and 10' block room dividers), and I think the rooms are, on average, smaller. There are more odd-shaped rooms, zig-zag passages, several isolated 30' circles (possibly chutes/shafts bypassing the level?), a number of 10x10' room maze areas with many doors, etc. There are more rooms than in the caves levels, but fewer than the Basic Dungeon (estimate: 20 rooms and 20 passages per section).

Doors: Excepting the Caves levels, there are doors (and secret doors) indicated throughout the different sections, although some rooms are missing doors, and thus disconnected from the rest. (The Introduction makes clear that you're expected add doors, delete or modify areas, etc.) There are a small number of these disconnected rooms in the Basic Dungeon, and a larger number of them in the Lower Dungeons areas (some sections more than others).

Passages: The vast majority of passages, corridors, and tunnels are 10' wide, rarely 20', and never any larger than that. About half of the Basic Dungeon tiles (8 of 15) have a single straight piece of 20' wide corridor, stretching about two-thirds the way across the tile. Arguably, there are no 20' corridors in any of the Caves or Lower sets; there are some 20' wide areas which might be interpreted as either cave/rooms or corridors, but in any case they're much shorter than in the Basic Dungeon. Even in the Caves levels, there are many 10' wide tunnels that run straight along a cardinal direction (to me, reminiscent of the sample tunnel sections in the module D1-3 product).

Central Areas: A common feature shared across all the sets is that each provides 3 sections that can be joined to create an enormous central area location -- perhaps a grand Arena/Cavern/Temple area. (Respectively these are sections ILF, ILO, and ILO in each of the 3 sets.) If joined, each of the versions of the huge central feature is about 22 squares on each side or somewhat larger (i.e., over 200 feet square).

Diagonals: One issue that motivated this overall article was the burning question: "How many diagonal features did Gygax expect to use on a typical dungeon map?". While design elements in the four cardinal directions (NSEW) are easy to deal with on graph paper, those on a non-cardinal 45 degree axis (NE, NW, SE, SW) tend to aggravate me, my players, my geometry sensibilities, and my software projects (see here). So I'll pay particularly close attention to those elements, to see how widespread they were expected to be.
#>