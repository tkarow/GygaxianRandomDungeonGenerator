#region Basic Dice Functions
function Get-D2Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 2
    Result = Get-Random -Minimum 1 -Maximum 3
    
    }

}

function Get-D4Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 4
    Result = Get-Random -Minimum 1 -Maximum 5
    
    }

}

function Get-D6Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 6
    Result = Get-Random -Minimum 1 -Maximum 7
    
    }

}

function Get-D8Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 8
    Result = Get-Random -Minimum 1 -Maximum 9
    
    }

}

function Get-D10Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 10
    Result = Get-Random -Minimum 1 -Maximum 11
    
    }

}

function Get-D12Roll{

    [pscustomobject]@{

    Min = 1
    Max = 12
    Result = Get-Random -Minimum 1 -Maximum 13
    
    }

}

function Get-D20Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 20
    Result = Get-Random -Minimum 1 -Maximum 21
    
    }

}

function Get-D100Roll{

    [pscustomobject]@{
    
    Min = 1
    Max = 100
    Result = Get-Random -Minimum 1 -Maximum 101
    
    }

}

#endregion

###################################

function Write-Rolls{
    
    Param(
    
    [parameter(Mandatory=$False)]
    $DieRolls
    
    )

    $Sum = ($DieRolls.Result | Measure-Object -Sum).Sum
    
    $UniqueDice = $DieRolls.Max | Sort-Object | Get-Unique
    
    $NumberOfUniqueRolls = foreach($UniqueDie in $UniqueDice){
     
        [pscustomobject]@{
    
            NumberofDice = ($DieRolls | ?{($_.Max -eq $UniqueDie)} | Measure-Object).Count
            UniqueDie = $UniqueDie
    
        }
     
    }

    #$SetofUniqueRolls = ($NumberOfUniqueRolls | %{"$($_.numberofdice)d$($_.uniquedie)"}) -join ', '
    $SetofUniqueRolls = ''
    $NumberOfUniqueRolls | %{$SetofUniqueRolls = "$($SetofUniqueRolls)$(if((($NumberOfUniqueRolls | Measure-Object).Count -gt 1) -and ($SetofUniqueRolls -ne '')){', '})$(if(($_ -eq $NumberOfUniqueRolls[-1]) -and (($NumberOfUniqueRolls | Measure-Object).Count -gt 1)){'and '})$($_.numberofdice)d$($_.uniquedie)"}

    "You rolled a total of $($Sum) on $($SetofUniqueRolls)"

}

###################################
#The following is my adaptation of Advanced Dungeons and Dragons' Dungeon Masters Guide' Appendix A (pg. 169 - 172) into PowerShell tables and functions

#region TABLE I.: PERIODIC CHECK (d20)
$Table1 = @{

1  = [pscustomobject]@{Description = "Continue straight - check again in 60' (this table)"}
2  = [pscustomobject]@{Description = "Continue straight - check again in 60' (this table)"}
3  = [pscustomobject]@{Description = "Door (see TABLE II.)"}
4  = [pscustomobject]@{Description = "Door (see TABLE II.)"}
5  = [pscustomobject]@{Description = "Door (see TABLE II.)"}
6  = [pscustomobject]@{Description = "Side Passage (see TABLE III.) - check again in 30' (this table)"}
7  = [pscustomobject]@{Description = "Side Passage (see TABLE III.) - check again in 30' (this table)"}
8  = [pscustomobject]@{Description = "Side Passage (see TABLE III.) - check again in 30' (this table)"}
9  = [pscustomobject]@{Description = "Side Passage (see TABLE III.) - check again in 30' (this table)"}
10 = [pscustomobject]@{Description = "Side Passage (see TABLE III.) - check again in 30' (this table)"}
11 = [pscustomobject]@{Description = "Passage Turns (see TABLE IV., check width on TABLE III.)"}
12 = [pscustomobject]@{Description = "Passage Turns (see TABLE IV., check width on TABLE III.)"}
13 = [pscustomobject]@{Description = "Passage Turns (see TABLE IV., check width on TABLE III.)"}
14 = [pscustomobject]@{Description = "Chamber (see TABLE V.) - check 30' after leaving (this table)"}
15 = [pscustomobject]@{Description = "Chamber (see TABLE V.) - check 30' after leaving (this table)"}
16 = [pscustomobject]@{Description = "Chamber (see TABLE V.) - check 30' after leaving (this table)"}
17 = [pscustomobject]@{Description = "Stairs (see TABLE VI.)"}
18 = [pscustomobject]@{Description = "Dead End (walls left, right, and ahead can be checked for Secret Doors, see TABLE V.D., footnote)"}
19 = [pscustomobject]@{Description = "Trick/Trap (see TABLE VII.), passage continues- check again in 30' (this table)"}
20 = [pscustomobject]@{Description = "Wandering Monster, check again immediately to see what lies ahead so direction of monster's approach can be determined."}

}

function Get-Table1Roll {

    [alias("Get-PeriodicCheckRoll")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll

    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table1.($Roll).Description
   
    }

}
#endregion

#region TABLE II.: DOORS (d20)
#Always check width of passage (TABLE III. A.)
#Location of Door:
$Table2 = @{

1  = [pscustomobject]@{Description = "Left"}
2  = [pscustomobject]@{Description = "Left"}
3  = [pscustomobject]@{Description = "Left"}
4  = [pscustomobject]@{Description = "Left"}
5  = [pscustomobject]@{Description = "Left"}
6  = [pscustomobject]@{Description = "Left"}
7  = [pscustomobject]@{Description = "Right"}
8  = [pscustomobject]@{Description = "Right"}
9  = [pscustomobject]@{Description = "Right"}
10 = [pscustomobject]@{Description = "Right"}
11 = [pscustomobject]@{Description = "Right"}
12 = [pscustomobject]@{Description = "Right"}
13 = [pscustomobject]@{Description = "Ahead"}
14 = [pscustomobject]@{Description = "Ahead"}
15 = [pscustomobject]@{Description = "Ahead"}
16 = [pscustomobject]@{Description = "Ahead"}
17 = [pscustomobject]@{Description = "Ahead"}
18 = [pscustomobject]@{Description = "Ahead"}
19 = [pscustomobject]@{Description = "Ahead"}
20 = [pscustomobject]@{Description = "Ahead"}

}

function Get-Table2Roll {

    [alias("Get-LocationOfDoorRoll")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll

    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table2.($Roll).Description
   
    }

}
#endregion

#region TABLE II. A.: DOORS (d20)
#Always check width of passage (TABLE III. A.)
#Space Beyond Door Is:
#Check again immediately on TABLE I. unless door is straight ahead; if another door is not indicated, then ignore the result and check again 30' past the door. If a room or chamber is beyond a door, go to TABLE V.
$Table2A = @{

1  = [pscustomobject]@{Description = "Parallel passage (extends 30' in both directions.) or 10' x 10' room if door is straight ahead"}
2  = [pscustomobject]@{Description = "Parallel passage (extends 30' in both directions.) or 10' x 10' room if door is straight ahead"}
3  = [pscustomobject]@{Description = "Parallel passage (extends 30' in both directions.) or 10' x 10' room if door is straight ahead"}
4  = [pscustomobject]@{Description = "Parallel passage (extends 30' in both directions.) or 10' x 10' room if door is straight ahead"}
5  = [pscustomobject]@{Description = "Passage straight ahead"}
6  = [pscustomobject]@{Description = "Passage straight ahead"}
7  = [pscustomobject]@{Description = "Passage straight ahead"}
8  = [pscustomobject]@{Description = "Passage straight ahead"}
9  = [pscustomobject]@{Description = "Passage 45 degrees ahead/behind (the direction will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"}
10 = [pscustomobject]@{Description = "Passage 45 degrees behind/ahead (the direction will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"}
11 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
12 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
13 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
14 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
15 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
16 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
17 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
18 = [pscustomobject]@{Description = "Room (go to TABLE V.)"}
19 = [pscustomobject]@{Description = "Chamber (go to TABLE V.)"}
20 = [pscustomobject]@{Description = "Chamber (go to TABLE V.)"}

}

function Get-Table2ARoll {

    [alias("Get-SpaceBeyondDoorRoll")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table2A.($Roll).Description
   
    }

}
#endregion

#region TABLE III.: SIDE PASSAGES (d20)
$Table3 = @{

1  = [pscustomobject]@{Description = "Left 90 degrees"}
2  = [pscustomobject]@{Description = "Left 90 degrees"}
3  = [pscustomobject]@{Description = "Right 90 degrees"}
4  = [pscustomobject]@{Description = "Right 90 degrees"}
5  = [pscustomobject]@{Description = "Left 45 degrees ahead"}
6  = [pscustomobject]@{Description = "Right 45 degrees ahead"}
7  = [pscustomobject]@{Description = "Left 45 degrees behind (left 135 degrees)"}
8  = [pscustomobject]@{Description = "Right 45 degrees behind (right 135 degrees)"}
9  = [pscustomobject]@{Description = "Left curve 45 degrees ahead"}
10 = [pscustomobject]@{Description = "Right curve 45 degrees ahead"}
11 = [pscustomobject]@{Description = "Passage `"T`"'s"}
12 = [pscustomobject]@{Description = "Passage `"T`"'s"}
13 = [pscustomobject]@{Description = "Passage `"T`"'s"}
14 = [pscustomobject]@{Description = "Passage `"Y`"'s"}
15 = [pscustomobject]@{Description = "Passage `"Y`"'s"}
16 = [pscustomobject]@{Description = "Four-way intersection"}
17 = [pscustomobject]@{Description = "Four-way intersection"}
18 = [pscustomobject]@{Description = "Four-way intersection"}
19 = [pscustomobject]@{Description = "Four-way intersection"}
20 = [pscustomobject]@{Description = "Passage `"X`"s (if present passage is horizontal or vertical it forms a fifth passage into the `"X`")"}

}

function Get-Table3Roll {

    [alias("Get-SidePassageRoll")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table3.($Roll).Description
   
    }

}
#endregion

#region TABLE III. A.: PASSAGE WIDTH (d20)
$Table3A = @{

1  = [pscustomobject]@{Description = "10'"}
2  = [pscustomobject]@{Description = "10'"}
3  = [pscustomobject]@{Description = "10'"}
4  = [pscustomobject]@{Description = "10'"}
5  = [pscustomobject]@{Description = "10'"}
6  = [pscustomobject]@{Description = "10'"}
7  = [pscustomobject]@{Description = "10'"}
8  = [pscustomobject]@{Description = "10'"}
9  = [pscustomobject]@{Description = "10'"}
10 = [pscustomobject]@{Description = "10'"}
11 = [pscustomobject]@{Description = "10'"}
12 = [pscustomobject]@{Description = "10'"}
13 = [pscustomobject]@{Description = "20'"}
14 = [pscustomobject]@{Description = "20'"}
15 = [pscustomobject]@{Description = "20'"}
16 = [pscustomobject]@{Description = "20'"}
17 = [pscustomobject]@{Description = "30'"}
18 = [pscustomobject]@{Description = "5'"}
19 = [pscustomobject]@{Description = "SPECIAL PASSAGE (TABLE III. B. below)"}
20 = [pscustomobject]@{Description = "SPECIAL PASSAGE (TABLE III. B. below)"}

}

function Get-Table3ARoll {

    [alias("Get-PassageWidth")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table3A.($Roll).Description
   
    }

}
#endregion

#region TABLE III. B.: SPECIAL PASSAGE (d20)
$Table3B = @{

1  = [pscustomobject]@{Description = "40', columns down center"}
2  = [pscustomobject]@{Description = "40', columns down center"}
3  = [pscustomobject]@{Description = "40', columns down center"}
4  = [pscustomobject]@{Description = "40', columns down center"}
5  = [pscustomobject]@{Description = "40', double row of columns"}
6  = [pscustomobject]@{Description = "40', double row of columns"}
7  = [pscustomobject]@{Description = "40', double row of columns"}
8  = [pscustomobject]@{Description = "50', double raw of columns"}
9  = [pscustomobject]@{Description = "50', double raw of columns"}
10 = [pscustomobject]@{Description = "50', double raw of columns"}
11 = [pscustomobject]@{Description = "50', columns 10' right and left support 10' wide upper galleries 20' above (stairs up to gallery will be at end of passage (1-15) or at beginning (16-20). In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (1 1-20) of the time.)"}
12 = [pscustomobject]@{Description = "50', columns 10' right and left support 10' wide upper galleries 20' above (stairs up to gallery will be at end of passage (1-15) or at beginning (16-20). In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (1 1-20) of the time.)"}
13 = [pscustomobject]@{Description = "10' stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"}
14 = [pscustomobject]@{Description = "10' stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"}
15 = [pscustomobject]@{Description = "10' stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"}
16 = [pscustomobject]@{Description = "20' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
17 = [pscustomobject]@{Description = "20' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
18 = [pscustomobject]@{Description = "40' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
19 = [pscustomobject]@{Description = "60' river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
20 = [pscustomobject]@{Description = "20', chasm (chasms bisect the passage. They are 150' to 200' deep. They will be bridged 50% (1-10) of the time, have a jumping place 5'-10' wide 25% (1 1-15) of the time, and be an obstacle 25% (16-20) of the time.)"}

}

function Get-Table3BRoll {

    [alias("Get-SpecialPassage")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table3B.($Roll).Description
   
    }

}
#endregion

#region TABLE IV.: TURNS (d20)
$Table4 = @{

1  = [pscustomobject]@{Description = "Left 90 degrees"}
2  = [pscustomobject]@{Description = "Left 90 degrees"}
3  = [pscustomobject]@{Description = "Left 90 degrees"}
4  = [pscustomobject]@{Description = "Left 90 degrees"}
5  = [pscustomobject]@{Description = "Left 90 degrees"}
6  = [pscustomobject]@{Description = "Left 90 degrees"}
7  = [pscustomobject]@{Description = "Left 90 degrees"}
8  = [pscustomobject]@{Description = "Left 90 degrees"}
9  = [pscustomobject]@{Description = "Left 45 degrees ahead"}
10 = [pscustomobject]@{Description = "Left 45 degrees behind (left 135 degrees)"}
11 = [pscustomobject]@{Description = "Right 90 degrees"}
12 = [pscustomobject]@{Description = "Right 90 degrees"}
13 = [pscustomobject]@{Description = "Right 90 degrees"}
14 = [pscustomobject]@{Description = "Right 90 degrees"}
15 = [pscustomobject]@{Description = "Right 90 degrees"}
16 = [pscustomobject]@{Description = "Right 90 degrees"}
17 = [pscustomobject]@{Description = "Right 90 degrees"}
18 = [pscustomobject]@{Description = "Right 90 degrees"}
19 = [pscustomobject]@{Description = "Right 45 degrees ahead"}
20 = [pscustomobject]@{Description = "Right 45 degrees behind (right 135 degrees)"}

}

function Get-Table4Roll {

    [alias("Get-Turns")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table4.($Roll).Description
   
    }

}
#endregion

#region TABLE V.: CHAMBERS AND ROOMS SHAPE AND SIZE (d20)
#(Roll for Shape, Size, and Exits: then' Contents, Treasure, and how the latter i s contained, if applicable.)
$Table5 = @{

1  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x20'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 10'x10'"}}
2  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x20'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 10'x10'"}}
3  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x20'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 20'x20'"}}
4  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x20'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 20'x20'"}}
5  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 30'x30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 30'x30'"}}
6  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 30'x30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 30'x30'"}}
7  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 40'x40'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 40'x40'"}}
8  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 40'x40'"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 40'x40'"}}
9  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 10' x 20'"}}
10 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 10' x 20'"}}
11 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 30'"}}
12 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 30'"}}
13 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 30'"}}
14 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 30' x 50'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 40'"}}
15 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 30' x 50'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 40'"}}
16 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 40' x 60'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 30' x 40'"}}
17 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 40' x 60'"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 30' x 40'"}}
18 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Unusual shape and size - see sub-tables below"};Room=[pscustomobject]@{Description="Unusual shape and size - see sub-tables below"}}
19 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Unusual shape and size - see sub-tables below"};Room=[pscustomobject]@{Description="Unusual shape and size - see sub-tables below"}}
20 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Unusual shape and size - see sub-tables below"};Room=[pscustomobject]@{Description="Unusual shape and size - see sub-tables below"}}

}

function Get-Table5Roll {

    [alias("Get-RoomShapeAndSize","Get-ChamberShapeAndSize")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
    
        [Parameter(Mandatory=$False)]
        [ValidateSet("Chamber","Room")]
        $Type
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = if($Type -eq "Room"){($Table5.($Roll)).Room}elseif($Type -eq "Chamber"){($Table5.($Roll)).Chamber.Description}else{@(($Table5.($Roll)).Chamber;($Table5.($Roll)).Room.Description)}
   
    }

}
#If unspecified, information for both a room and chamber is returned
#Get-Table5Roll -Type Room
#endregion

#region TABLE V. A.: UNUSUAL SHAPE (Roll Separately for Size) (d20)
$Table5A = @{

1  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"}
2  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"}
3  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"}
4  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"}
5  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)"}
6  = [pscustomobject]@{Description = "Triangular"}
7  = [pscustomobject]@{Description = "Triangular"}
8  = [pscustomobject]@{Description = "Triangular"}
9  = [pscustomobject]@{Description = "Trapezoidal"}
10 = [pscustomobject]@{Description = "Trapezoidal"}
11 = [pscustomobject]@{Description = "Trapezoidal"}
12 = [pscustomobject]@{Description = "Odd-shaped (Draw what shape you desire or what will fit the map - it is a special shape if desired)"}
13 = [pscustomobject]@{Description = "Odd-shaped (Draw what shape you desire or what will fit the map - it is a special shape if desired)"}
14 = [pscustomobject]@{Description = "Oval"}
15 = [pscustomobject]@{Description = "Oval"}
16 = [pscustomobject]@{Description = "Hexagonal"}
17 = [pscustomobject]@{Description = "Hexagonal"}
18 = [pscustomobject]@{Description = "Octagonal"}
19 = [pscustomobject]@{Description = "Octagonal"}
20 = [pscustomobject]@{Description = "Cave"}

}

function Get-Table5ARoll {

    [alias("Get-UnusualRoomShape","Get-UnusualChamberShape")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5A.($Roll).Description
   
    }

}
#endregion

#region TABLE V. B.: UNUSUAL SIZE (d20)
$Table5B = @{

1  = [pscustomobject]@{Description = "About 500 sq. ft."}
2  = [pscustomobject]@{Description = "About 500 sq. ft."}
3  = [pscustomobject]@{Description = "About 500 sq. ft."}
4  = [pscustomobject]@{Description = "About 900 sq. ft."}
5  = [pscustomobject]@{Description = "About 900 sq. ft."}
6  = [pscustomobject]@{Description = "About 900 sq. ft."}
7  = [pscustomobject]@{Description = "About 1,300 sq. ft."}
8  = [pscustomobject]@{Description = "About 1,300 sq. ft."}
9  = [pscustomobject]@{Description = "About 2,000 sq. ft."}
10 = [pscustomobject]@{Description = "About 2,000 sq. ft."}
11 = [pscustomobject]@{Description = "About 2,700 sq. ft."}
12 = [pscustomobject]@{Description = "About 2,700 sq. ft."}
13 = [pscustomobject]@{Description = "About 3,400 sq. ft."}
14 = [pscustomobject]@{Description = "About 3,400 sq. ft."}
15 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"}
16 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"}
17 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"}
18 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"}
19 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"}
20 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-l0above, and so on)"}

}

function Get-Table5BRoll {

    [alias("Get-UnusualRoomSize","Get-UnusualChamberSize")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5B.($Roll).Description
   
    }

}
#endregion

#region TABLE V. C.: NUMBER OF EXITS (d20)
$Table5C = @{

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

function Get-Table5CRoll {

    [alias("Get-NumberOfExits")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        $RoomArea
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}
    if(!$RoomArea){$RoomArea = @(500,800,1400,3000)[(Get-Random -Minimum 0 -Maximum 4)];$Unspecified = $True}

    [pscustomobject]@{
   
        Roll = $Roll;
        RoomArea = "$($RoomArea)$(if($Unspecified){' (Unspecified)'})";
        Description = ($Table5C.($Roll) | ?{($_.'Room Area Lower Limit' -le $RoomArea) -and ($_.'Room Area Upper Limit' -ge $RoomArea)}).'Number of Exits'
   
    }

}
#If unspecified, a room or chamber is randomly selected, noted in parentheses, and its data is returned
#endregion

#region TABLE V. D.: EXIT LOCATION '(d20)
#If a passage or door is indicated in a wall where the space immediately beyond the wall has already been mapped, then the exit is either a secret door (1-5) or a one-way door (6-10) or it is in the opposite direction (11-20).
$Table5D = @{

1  = [pscustomobject]@{Description = "Opposite wall"}
2  = [pscustomobject]@{Description = "Opposite wall"}
3  = [pscustomobject]@{Description = "Opposite wall"}
4  = [pscustomobject]@{Description = "Opposite wall"}
5  = [pscustomobject]@{Description = "Opposite wall"}
6  = [pscustomobject]@{Description = "Opposite wall"}
7  = [pscustomobject]@{Description = "Opposite wall"}
8  = [pscustomobject]@{Description = "Left wall"}
9  = [pscustomobject]@{Description = "Left wall"}
10 = [pscustomobject]@{Description = "Left wall"}
11 = [pscustomobject]@{Description = "Left wall"}
12 = [pscustomobject]@{Description = "Left wall"}
13 = [pscustomobject]@{Description = "Right wall"}
14 = [pscustomobject]@{Description = "Right wall"}
15 = [pscustomobject]@{Description = "Right wall"}
16 = [pscustomobject]@{Description = "Right wall"}
17 = [pscustomobject]@{Description = "Right wall"}
18 = [pscustomobject]@{Description = "Same wall"}
19 = [pscustomobject]@{Description = "Same wall"}
20 = [pscustomobject]@{Description = "Same wall"}

}

function Get-Table5DRoll {

    [alias("Get-ExitLocation")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5D.($Roll).Description
   
    }

}
#endregion

#region TABLE V. E.: EXIT DIRECTION (d20)
$Table5E = @{

1  = [pscustomobject]@{Description = "Straight ahead"}
2  = [pscustomobject]@{Description = "Straight ahead"}
3  = [pscustomobject]@{Description = "Straight ahead"}
4  = [pscustomobject]@{Description = "Straight ahead"}
5  = [pscustomobject]@{Description = "Straight ahead"}
6  = [pscustomobject]@{Description = "Straight ahead"}
7  = [pscustomobject]@{Description = "Straight ahead"}
8  = [pscustomobject]@{Description = "Straight ahead"}
9  = [pscustomobject]@{Description = "Straight ahead"}
10 = [pscustomobject]@{Description = "Straight ahead"}
11 = [pscustomobject]@{Description = "Straight ahead"}
12 = [pscustomobject]@{Description = "Straight ahead"}
13 = [pscustomobject]@{Description = "Straight ahead"}
14 = [pscustomobject]@{Description = "Straight ahead"}
15 = [pscustomobject]@{Description = "Straight ahead"}
16 = [pscustomobject]@{Description = "Straight ahead"}
17 = [pscustomobject]@{Description = "45 degrees left/right (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"}
18 = [pscustomobject]@{Description = "45 degrees left/right (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"}
19 = [pscustomobject]@{Description = "45 degrees right/left (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"}
20 = [pscustomobject]@{Description = "45 degrees right/left (The exit will be appropriate to existing circumstances, but use the direction before the slash in preference to the other.)"}

}

function Get-Table5ERoll {

    [alias("Get-ExitDirection")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5E.($Roll).Description
   
    }

}
#endregion

#region TABLE V. F.: CHAMBER OR ROOM CONTENTS (d20)
$Table5F = @{

1  = [pscustomobject]@{Description = "Empty"}
2  = [pscustomobject]@{Description = "Empty"}
3  = [pscustomobject]@{Description = "Empty"}
4  = [pscustomobject]@{Description = "Empty"}
5  = [pscustomobject]@{Description = "Empty"}
6  = [pscustomobject]@{Description = "Empty"}
7  = [pscustomobject]@{Description = "Empty"}
8  = [pscustomobject]@{Description = "Empty"}
9  = [pscustomobject]@{Description = "Empty"}
10 = [pscustomobject]@{Description = "Empty"}
11 = [pscustomobject]@{Description = "Empty"}
12 = [pscustomobject]@{Description = "Empty"}
13 = [pscustomobject]@{Description = "Monster only (determine on appropriate table from APPENDIX C RANDOM MONSTER ENCOUNTERS, Dungeon Encounter Matrix)."}
14 = [pscustomobject]@{Description = "Monster only (determine on appropriate table from APPENDIX C RANDOM MONSTER ENCOUNTERS, Dungeon Encounter Matrix)."}
15 = [pscustomobject]@{Description = "Monster and treasure (see TABLE V.G. below)"}
16 = [pscustomobject]@{Description = "Monster and treasure (see TABLE V.G. below)"}
17 = [pscustomobject]@{Description = "Monster and treasure (see TABLE V.G. below)"}
18 = [pscustomobject]@{Description = "Special (Determine by balance of level or put in what you desire; otherwise put in stairs as indicated), or contains stairway up 1 level (1-5), up 2 levels (7-E), down 1 level (9-14), down 2 levels (15-19), or down 3 levels- 2 flights of stairs and a slanting passageway (20)."}
19 = [pscustomobject]@{Description = "Trick/Trap (see TABLE VII.)"}
20 = [pscustomobject]@{Description = "Treasure (see TABLE V.G.)"}

}

function Get-Table5FRoll {

    [alias("Get-RoomContents","Get-ChamberContents")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5F.($Roll).Description
   
    }

}
#endregion

#region TABLE V. G.: TREASURE* (d%)
#*See also TABLES V. H. and I. or J.
$Table5G = @(

[pscustomobject]@{Min = 1;Max = 25;NoMonster = '1,000 copper pieces/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 26;Max = 50;NoMonster = '1,000 silver pieces/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 51;Max = 65;NoMonster = '750 electrum pieces/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 66;Max = 80;NoMonster = '250 gold pieces/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 81;Max = 90;NoMonster = '100 platinum pieces/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 91;Max = 94;NoMonster = '1-4 gems/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 95;Max = 97;NoMonster = '1 piece jewelry/level';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}
[pscustomobject]@{Min = 98;Max = 100;NoMonster = 'Magic (roll once on Magic Items Table)';WMonster = 'Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}

)

function Get-Table5GRoll {

    [alias("Get-Treasure")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [bool]$Monster
    
    )

    if(!$Roll){$Roll = (Get-D100Roll).Result}
    if(!$Monster){@($True,$False)[(Get-Random -Minimum 0 -Maximum 2)];$Unspecified = $True}

    [pscustomobject]@{
   
        Roll = $Roll;
        Monster = $("$Monster$(if($Unspecified){' (Unspecified)'})");
        Description = "$(if($Monster -eq $False){($Table5G | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}).NoMonster}else{($Table5G | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}).WMonster})"
   
    }

}
#If unspecified, monster presence is randomly selected, noted in parentheses, and its data is returned
#endregion

#region TABLE V. H.: TREASURE IS CONTAINED IN* (d20)
#*Go to TABLE V. I. on a roll of 1-8, TABLE V. J. on a 9-20 to determine protection if desired.
$Table5H = @{

1  = [pscustomobject]@{Description = "Bags"}
2  = [pscustomobject]@{Description = "Bags"}
3  = [pscustomobject]@{Description = "Sacks"}
4  = [pscustomobject]@{Description = "Sacks"}
5  = [pscustomobject]@{Description = "Small Coffers"}
6  = [pscustomobject]@{Description = "Small Coffers"}
7  = [pscustomobject]@{Description = "Chests"}
8  = [pscustomobject]@{Description = "Chests"}
9  = [pscustomobject]@{Description = "Huge Chests"}
10 = [pscustomobject]@{Description = "Huge Chests"}
11 = [pscustomobject]@{Description = "Pottery Jars"}
12 = [pscustomobject]@{Description = "Pottery Jars"}
13 = [pscustomobject]@{Description = "Metal Urns"}
14 = [pscustomobject]@{Description = "Metal Urns"}
15 = [pscustomobject]@{Description = "Stone Containers"}
16 = [pscustomobject]@{Description = "Stone Containers"}
17 = [pscustomobject]@{Description = "Iron Trunks"}
18 = [pscustomobject]@{Description = "Iron Trunks"}
19 = [pscustomobject]@{Description = "Loose"}
20 = [pscustomobject]@{Description = "Loose"}

}

function Get-Table5HRoll {

    [alias("Get-TreasureContainer")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

   if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5H.($Roll).Description
   
    }

}
#endregion

#region TABLE V. I.: TREASURE IS GUARDED BY (d20)
$Table5I = @{

1  = [pscustomobject]@{Description = "Contact poison on container"}
2  = [pscustomobject]@{Description = "Contact poison on container"}
3  = [pscustomobject]@{Description = "Contact poison on treasure"}
4  = [pscustomobject]@{Description = "Contact poison on treasure"}
5  = [pscustomobject]@{Description = "Poisoned needles in lock"}
6  = [pscustomobject]@{Description = "Poisoned needles in lock"}
7  = [pscustomobject]@{Description = "Poisoned needles in handles"}
8  = [pscustomobject]@{Description = "Spring darts firing from front of container"}
9  = [pscustomobject]@{Description = "Spring darts firing up from top of container"}
10 = [pscustomobject]@{Description = "Spring darts firing up from inside bottom of container"}
11 = [pscustomobject]@{Description = "Blade scything across inside"}
12 = [pscustomobject]@{Description = "Blade scything across inside"}
13 = [pscustomobject]@{Description = "Poisonous insects or reptiles living inside container"}
14 = [pscustomobject]@{Description = "Gas released by opening container"}
15 = [pscustomobject]@{Description = "Trapdoor opening in front of container"}
16 = [pscustomobject]@{Description = "Trapdoor opening 6' in front of container"}
17 = [pscustomobject]@{Description = "Stone block dropping in front of the container"}
18 = [pscustomobject]@{Description = "Spears released from walls when container opened"}
19 = [pscustomobject]@{Description = "Explosive runes"}
20 = [pscustomobject]@{Description = "Symbol"}

}

function Get-Table5IRoll {

    [alias("Get-TreasureGuard")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5I.($Roll).Description
   
    }

}
#endregion

#region TABLE V. J.: TREASURE IS HIDDEN BY/IN (d20)
$Table5J = @{

1  = [pscustomobject]@{Description = "Invisibility"}
2  = [pscustomobject]@{Description = "Invisibility"}
3  = [pscustomobject]@{Description = "Invisibility"}
4  = [pscustomobject]@{Description = "Illusion (to change or hide appearance)"}
5  = [pscustomobject]@{Description = "Illusion (to change or hide appearance)"}
6  = [pscustomobject]@{Description = "Secret space under container"}
7  = [pscustomobject]@{Description = "Secret compartment in container"}
8  = [pscustomobject]@{Description = "Secret compartment in container"}
9  = [pscustomobject]@{Description = "Inside ordinary item in plain view"}
10 = [pscustomobject]@{Description = "Disguised to appear as something else"}
11 = [pscustomobject]@{Description = "Under a heap of trash/dung"}
12 = [pscustomobject]@{Description = "Under a loose stone in the floor"}
13 = [pscustomobject]@{Description = "Under a loose stone in the floor"}
14 = [pscustomobject]@{Description = "Behind a loose stone in the wall"}
15 = [pscustomobject]@{Description = "Behind a loose stone in the wall"}
16 = [pscustomobject]@{Description = "In a secret room nearby"}
17 = [pscustomobject]@{Description = "In a secret room nearby"}
18 = [pscustomobject]@{Description = "In a secret room nearby"}
19 = [pscustomobject]@{Description = "In a secret room nearby"}
20 = [pscustomobject]@{Description = "In a secret room nearby"}

}

function Get-Table5JRoll {

    [alias("Get-HiddenTreasure")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

   if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5J.($Roll).Description
   
    }

}
#endregion

#region TABLE VI.: STAIRS (d20)
$Table6 = @{

1  = [pscustomobject]@{Description = "Down 1 level (1 in 20 has a door which closes egress for the day.)"}
2  = [pscustomobject]@{Description = "Down 1 level (1 in 20 has a door which closes egress for the day.)"}
3  = [pscustomobject]@{Description = "Down 1 level (1 in 20 has a door which closes egress for the day.)"}
4  = [pscustomobject]@{Description = "Down 1 level (1 in 20 has a door which closes egress for the day.)"}
5  = [pscustomobject]@{Description = "Down 1 level (1 in 20 has a door which closes egress for the day.)"}
6  = [pscustomobject]@{Description = "Down 2 levels (2 in 20 has a door which closes egress for the day.)"}
7  = [pscustomobject]@{Description = "Down 3 levels (3 in 20 has a door which closes egress for the day.)"}
8  = [pscustomobject]@{Description = "Up 1 level"}
9  = [pscustomobject]@{Description = "Up dead end (1 in 6 chance to chute down 2 levels)"}
10 = [pscustomobject]@{Description = "Down dead end (1 in 6 chance to chute down 1 level)"}
11 = [pscustomobject]@{Description = "Chimney up 1 level, passage continues, check again in 30'"}
12 = [pscustomobject]@{Description = "Chimney up 2 levels, passage continues, check again in 30'"}
13 = [pscustomobject]@{Description = "Chimney down 2 levels, passage continues, check again in 30'"}
14 = [pscustomobject]@{Description = "Trap door down 1 level, passage continues, check again in 30'"}
15 = [pscustomobject]@{Description = "Trap door down 1 level, passage continues, check again in 30'"}
16 = [pscustomobject]@{Description = "Trap door down 1 level, passage continues, check again in 30'"}
17 = [pscustomobject]@{Description = "Trap door down 2 levels, passage continues, check again in 30'"}
18 = [pscustomobject]@{Description = "Up 1 then down 2 (total down 1),chamber at end (roll on TABLE V.)"}
19 = [pscustomobject]@{Description = "Up 1 then down 2 (total down 1),chamber at end (roll on TABLE V.)"}
20 = [pscustomobject]@{Description = "Up 1 then down 2 (total down 1),chamber at end (roll on TABLE V.)"}

}
#N.B. Check for such doors only after descending steps if playing solo!

function Get-Table6Roll {

    [alias("Get-HiddenTreasure")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll

    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table6.($Roll).Description
   
    }

}
#endregion

#region TABLE VII.: TRICK/TRAP (d20)
$Table7 = @{

1  = [pscustomobject]@{Description = "Secret Door unless unlocated: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.). Unlocated secret doors go to die 6,7 below."}
2  = [pscustomobject]@{Description = "Secret Door unless unlocated: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.). Unlocated secret doors go to die 6,7 below."}
3  = [pscustomobject]@{Description = "Secret Door unless unlocated: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.). Unlocated secret doors go to die 6,7 below."}
4  = [pscustomobject]@{Description = "Secret Door unless unlocated: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.). Unlocated secret doors go to die 6,7 below."}
5  = [pscustomobject]@{Description = "Secret Door unless unlocated: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.). Unlocated secret doors go to die 6,7 below."}
6  = [pscustomobject]@{Description = "Pit, 10' deep, 3 in 6 to fall in."}
7  = [pscustomobject]@{Description = "Pit, 10' deep, 3 in 6 to fall in."}
8  = [pscustomobject]@{Description = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
9  = [pscustomobject]@{Description = "20' x 20' elevator room (party has entered door directly ahead and is in room), descends 1 level and will not ascend for 30 turns."}
10 = [pscustomobject]@{Description = "As 9. above, but room descends 2 levels"}
11 = [pscustomobject]@{Description = "As above, but room descends 2-5 levels - 1 upon entering and 1 additional level each time an unsuccessful attempt at door opening is made, or until it descends as far as it can. This will not ascend for 60 turns."}
12 = [pscustomobject]@{Description = "Wall 10' behind slides across passage blocking it for from 40-60 turns."}
13 = [pscustomobject]@{Description = "Oil (equal to one flask) pours on random person from hole in ceiling, followed by flaming cinder (2-12 h.p. damage unless successful save vs. magic is made, which indicates only 1-3 h.p. damage)."}
14 = [pscustomobject]@{Description = "Pit, 10' deep, 3 in 6 to fall in, pit walls move together to crush victim(s) in 2-5 rounds."}
15 = [pscustomobject]@{Description = "Arrow trap, 1-3 arrows, 1 in 20 is poisoned."}
16 = [pscustomobject]@{Description = "Spear trap, 1-3 spears, 1 in 20 is poisoned"}
17 = [pscustomobject]@{Description = "Gas; party has detected it, but must breathe it to continue along corridor, as it covers 60' ahead. Mark map accordingly regardless of turning back or not. (See TABLE VII. A.)"}
18 = [pscustomobject]@{Description = "Door falls outward causing 1-10 hit points, or stone falls from ceiling causing 2-20 hit points of damage to each person failing his saving throw versus petrification."}
19 = [pscustomobject]@{Description = "Illusionary wall concealing 8. (pit) above (1-6), 20. (chute) below (7-10) or chamber with monster and treasure (11-20) (see TABLE V.)."}
#Above should read "Illusionary wall concealing: 
#1-6: pit as 8 above
#7-10: chute as 20 below
#11-20: chamber with monster and treasure (see TABLE V.)
20 = [pscustomobject]@{Description = "Chute down 1 level (cannot be ascended in any manner)."}

}

function Get-Table7Roll {

    [alias("Get-Trick","Get-Track","Get-TrickOrTrack")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table7.($Roll).Description
   
    }

}
#endregion

#region TABLE VII. A.: GAS SUB-TABLE (d20)
$Table7A = @{

1  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
2  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
3  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
4  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
5  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
6  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
7  = [pscustomobject]@{Description = "Only effect is to obscure vision when passing through."}
8  = [pscustomobject]@{Description = "Blindsfor 1-6 turns after passing through."}
9  = [pscustomobject]@{Description = "Blindsfor 1-6 turns after passing through."}
10 = [pscustomobject]@{Description = "Fear: run back 120' feet unless saving throw versus magic is made."}
11 = [pscustomobject]@{Description = "Fear: run back 120' feet unless saving throw versus magic is made."}
12 = [pscustomobject]@{Description = "Fear: run back 120' feet unless saving throw versus magic is made."}
13 = [pscustomobject]@{Description = "Sleep: party sound asleep for 2-12 turns (as sleep spell)."}
14 = [pscustomobject]@{Description = "Strength: adds 1-6 points of strength (as strength spell) to all fighters in party for 1 to 10 hours."}
15 = [pscustomobject]@{Description = "Strength: adds 1-6 points of strength (as strength spell) to all fighters in party for 1 to 10 hours."}
16 = [pscustomobject]@{Description = "Strength: adds 1-6 points of strength (as strength spell) to all fighters in party for 1 to 10 hours."}
17 = [pscustomobject]@{Description = "Strength: adds 1-6 points of strength (as strength spell) to all fighters in party for 1 to 10 hours."}
18 = [pscustomobject]@{Description = "Strength: adds 1-6 points of strength (as strength spell) to all fighters in party for 1 to 10 hours."}
19 = [pscustomobject]@{Description = "Sickness: return to surface immediately."}
20 = [pscustomobject]@{Description = "Poison: killed unless saving throw versus poison is made."}

}
#CAVES AND CAVERNS FOR LOWEST LEVELS:
#You may wish to have "roughhewn" and natural tunnels in lower levels, and where rooms and chambers are indicated substitute Caves and Caverns. Exits are as above.

function Get-Table7ARoll {

    [alias("Get-Gas")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table7A.($Roll).Description
   
    }

}
#endregion

#region TABLE VIII.: CAVES AND CAVERNS (d20)
$Table8 = @{

1  = [pscustomobject]@{Description = "Cave about 40' x 60'"}
2  = [pscustomobject]@{Description = "Cave about 40' x 60'"}
3  = [pscustomobject]@{Description = "Cave about 40' x 60'"}
4  = [pscustomobject]@{Description = "Cave about 40' x 60'"}
5  = [pscustomobject]@{Description = "Cave about 40' x 60'"}
6  = [pscustomobject]@{Description = "Cave about 50' x75'"}
7  = [pscustomobject]@{Description = "Cave about 50' x75'"}
8  = [pscustomobject]@{Description = "Double Cave: 20' x 30', 60' x 60'"}
9  = [pscustomobject]@{Description = "Double Cave: 20' x 30', 60' x 60'"}
10 = [pscustomobject]@{Description = "Double Cave: 35' x 50', 80' x 90' (Roll to see if pool therein (see TABLE VII1. A.).)"}
11 = [pscustomobject]@{Description = "Double Cave: 35' x 50', 80' x 90' (Roll to see if pool therein (see TABLE VII1. A.).)"}
12 = [pscustomobject]@{Description = "Cavern about 95' x 125' (Roll to see if pool therein (see TABLE VII1. A.).)"}
13 = [pscustomobject]@{Description = "Cavern about 95' x 125' (Roll to see if pool therein (see TABLE VII1. A.).)"}
14 = [pscustomobject]@{Description = "Cavern about 95' x 125' (Roll to see if pool therein (see TABLE VII1. A.).)"}
15 = [pscustomobject]@{Description = "Cavern about 120' x 150'"}
16 = [pscustomobject]@{Description = "Cavern about 120' x 150'"}
17 = [pscustomobject]@{Description = "Cavern about 150' X 200' (Roll to see if pool therein (see TABLE VII1. A.).)"}
18 = [pscustomobject]@{Description = "Cavern about 150' X 200' (Roll to see if pool therein (see TABLE VII1. A.).)"}
19 = [pscustomobject]@{Description = "Mammoth cavern about 250'-300' X 350'-400 (Roll to see if lake therein (see TABLE VIII. B.).)"}
20 = [pscustomobject]@{Description = "Mammoth cavern about 250'-300' X 350'-400 (Roll to see if lake therein (see TABLE VIII. B.).)"}

}

function Get-Table8Roll {

    [alias("Get-Cave","Get-Cavern","Get-CaveOrCavern")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table8.($Roll).Description
   
    }

}
#endregion

#region TABLE VIII. A.: POOLS (d20)
$Table8A = @{

1  = [pscustomobject]@{Description = "No pool"}
2  = [pscustomobject]@{Description = "No pool"}
3  = [pscustomobject]@{Description = "No pool"}
4  = [pscustomobject]@{Description = "No pool"}
5  = [pscustomobject]@{Description = "No pool"}
6  = [pscustomobject]@{Description = "No pool"}
7  = [pscustomobject]@{Description = "No pool"}
8  = [pscustomobject]@{Description = "No pool"}
9  = [pscustomobject]@{Description = "Pool, no monster"}
10 = [pscustomobject]@{Description = "Pool, no monster"}
11 = [pscustomobject]@{Description = "Pool, monster"}
12 = [pscustomobject]@{Description = "Pool, monster"}
13 = [pscustomobject]@{Description = "Pool, monster8 treasure"}
14 = [pscustomobject]@{Description = "Pool, monster8 treasure"}
15 = [pscustomobject]@{Description = "Pool, monster8 treasure"}
16 = [pscustomobject]@{Description = "Pool, monster8 treasure"}
17 = [pscustomobject]@{Description = "Pool, monster8 treasure"}
18 = [pscustomobject]@{Description = "Pool, monster8 treasure"}
19 = [pscustomobject]@{Description = "Magical pool (See TABLE VIII. C.)"}
20 = [pscustomobject]@{Description = "Magical pool (See TABLE VIII. C.)"}

}

function Get-Table8ARoll {

    [alias("Get-Pool")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
    Description = $Table8A.($Roll).Description
   
    }

}
#endregion

#region TABLE VIII. B.: LAKES (d20)
$Table8B = @{

1  = [pscustomobject]@{Description = "No lake"}
2  = [pscustomobject]@{Description = "No lake"}
3  = [pscustomobject]@{Description = "No lake"}
4  = [pscustomobject]@{Description = "No lake"}
5  = [pscustomobject]@{Description = "No lake"}
6  = [pscustomobject]@{Description = "No lake"}
7  = [pscustomobject]@{Description = "No lake"}
8  = [pscustomobject]@{Description = "No lake"}
9  = [pscustomobject]@{Description = "No lake"}
10 = [pscustomobject]@{Description = "No lake"}
11 = [pscustomobject]@{Description = "Lake, no monsters"}
12 = [pscustomobject]@{Description = "Lake, no monsters"}
13 = [pscustomobject]@{Description = "Lake, no monsters"}
14 = [pscustomobject]@{Description = "Lake, no monsters"}
15 = [pscustomobject]@{Description = "Lake, no monsters"}
16 = [pscustomobject]@{Description = "Lake, monsters (Determine monster and treasure from appropriate encounter matrix.)"}
17 = [pscustomobject]@{Description = "Lake, monsters (Determine monster and treasure from appropriate encounter matrix.)"}
18 = [pscustomobject]@{Description = "Lake, monsters (Determine monster and treasure from appropriate encounter matrix.)"}
19 = [pscustomobject]@{Description = "Enchanted lake (Enchanted lake leads any who manage to cross it to another dimension, special temple, etc. (if special map is available, otherwise treat as lake with monsters), 90% chance that monster will guard lake.)"}
20 = [pscustomobject]@{Description = "Enchanted lake (Enchanted lake leads any who manage to cross it to another dimension, special temple, etc. (if special map is available, otherwise treat as lake with monsters), 90% chance that monster will guard lake.)"}

}

function Get-Table8BRoll {

    [alias("Get-Lake")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table8B.($Roll).Description
   
    }

}
#endregion

#region TABLE VIII. C.: MAGIC POOLS (d20)
#(In order to find out what they are, characters must enter the magic pools.)
$Table8C = @{

1  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
2  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
3  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
4  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
5  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
6  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
7  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
8  = [pscustomobject]@{Description = "Turns gold to platinum (1-11) or lead (12-20), one time only."}
9  = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
10 = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
11 = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
12 = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
13 = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
14 = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
15 = [pscustomobject]@{Description = "Will, on a one-time only basis, add (1-3) or subtract (4-6) from one characteristic of all who stand within it:
1 = Strength
2 = Intelligence
3 = Wisdom
4 = Dexterity
5 = Constitution
6 = Charisma
(Add or subtract from 1-3 points, checking for each character as to addition or subtraction, characteristic, and amount)."}
16 = [pscustomobject]@{Description = "Talking pool which will grant 1 wish to characters of its alignment and damage others from 1-20 points. Wish can be withheld for up to 1 day. Pool's alignment is: lawful good 1-6, lawful evil 7-9, chaotic good 10-12, chaotic evil 13-17, neutral 18-20"}
17 = [pscustomobject]@{Description = "Talking pool which will grant 1 wish to characters of its alignment and damage others from 1-20 points. Wish can be withheld for up to 1 day. Pool's alignment is: lawful good 1-6, lawful evil 7-9, chaotic good 10-12, chaotic evil 13-17, neutral 18-20"}
18 = [pscustomobject]@{Description = "Transporter pool: 1-7,back to surface; 8-12,elsewhere on level; 13-16, 1 level down; 17-20, 100 miles away for outdoor adventure."}
19 = [pscustomobject]@{Description = "Transporter pool: 1-7,back to surface; 8-12,elsewhere on level; 13-16, 1 level down; 17-20, 100 miles away for outdoor adventure."}
20 = [pscustomobject]@{Description = "Transporter pool: 1-7,back to surface; 8-12,elsewhere on level; 13-16, 1 level down; 17-20, 100 miles away for outdoor adventure."}

}

function Get-Table8CRoll {

    [alias("Get-MagicPool")]
    param(
    
        [Parameter(Mandatory=$False)]
        [int]$Roll
    
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table8C.($Roll).Description
   
    }

}
#endregion

###################################

#To do:

#Standardize English- capitalization, parenthetical grammar, spacing, etc.
#Standardize PowerShell syntax- spacing, line breaks, capitalization, etc.
#Add a new element for each table roll that will make sub-rolls for a result when appropriate
#Add a new element for each table roll taht will roll all remaining components of a dungeon "module" (e.g. Roll a room's shape, size, contents, number of exits, location of exits, etc.)
#Add a visual representation of the room/chamber/corridor/etc.

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
