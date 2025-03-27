#region Basic Dice Functions
function Get-D2Roll{

    [pscustomobject]@{
   
    Min = 1
    Max = 2
    Result = Get-Random -Minimum 1 -Maximum 3
   
    }

}

function Get-D3Roll{

    [pscustomobject]@{
   
    Min = 1
    Max = 3
    Result = Get-Random -Minimum 1 -Maximum 4
   
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

    $SetofUniqueRolls = ''
    $NumberOfUniqueRolls | %{$SetofUniqueRolls = "$($SetofUniqueRolls)$(if((($NumberOfUniqueRolls | Measure-Object).Count -gt 1) -and ($SetofUniqueRolls -ne '')){', '})$(if(($_ -eq $NumberOfUniqueRolls[-1]) -and (($NumberOfUniqueRolls | Measure-Object).Count -gt 1)){'and '})$($_.numberofdice)d$($_.uniquedie)"}

    "You rolled a total of $($Sum) on $($SetofUniqueRolls)"

}

###################################
#region Appendix A
#The following is my adaptation of Advanced Dungeons and Dragons' Dungeon Masters Guide's Appendix A (pg. 169 - 172) into PowerShell tables and functions

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
#Location of exit:
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

    [alias("Get-LocationOfDoorRoll","Get-LocationOfExitRoll")]
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
8  = [pscustomobject]@{Description = "50', double row of columns"}
9  = [pscustomobject]@{Description = "50', double row of columns"}
10 = [pscustomobject]@{Description = "50', double row of columns"}
11 = [pscustomobject]@{Description = "50', columns 10' right and left support 10' wide upper galleries 20' above (stairs up to gallery will be at end of passage (1-15) or at beginning (16-20). In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (11-20) of the time.)"}
12 = [pscustomobject]@{Description = "50', columns 10' right and left support 10' wide upper galleries 20' above (stairs up to gallery will be at end of passage (1-15) or at beginning (16-20). In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (11-20) of the time.)"}
13 = [pscustomobject]@{Description = "10', stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"}
14 = [pscustomobject]@{Description = "10', stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"}
15 = [pscustomobject]@{Description = "10', stream (streams bisect the passage. They will be bridged 75% (1-15) of the time and be an obstacle 25% (16-20) of the time.)"}
16 = [pscustomobject]@{Description = "20', river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
17 = [pscustomobject]@{Description = "20', river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
18 = [pscustomobject]@{Description = "40', river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
19 = [pscustomobject]@{Description = "60', river (rivers bisect the passage. They will be bridged 50% (1-10) of the time, have a boat 25% (11-15) of the time (50% chance for either bank), and be an obstacle 25% of the time.)"}
20 = [pscustomobject]@{Description = "20', chasm (chasms bisect the passage. They are 150' to 200' deep. They will be bridged 50% (1-10) of the time, have a jumping place 5'-10' wide 25% (1 1-15) of the time, and be an obstacle 25% (16-20) of the time.)"}

}

function Get-Table3BRoll {

    [alias("Get-SpecialPassage")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    $SpecificSpecial = "N/A"
    if(!$Roll){$Roll = (Get-D20Roll).Result}

    if($Roll -ge 11){

        $SpecificSpecialRoll = (Get-D20Roll).Result
    
        switch($Roll){
        
            11 {$SpecificSpecial = "50', columns 10' right and left support 10' wide upper galleries 20' above. $(if($SpecificSpecialRoll -le 15){"Stairs to gallery are at the end of the passage."}else{"Stairs to gallery are at the beginning of the passage."})"}
            12 {$SpecificSpecial = "50', columns 10' right and left support 10' wide upper galleries 20' above. $(if($SpecificSpecialRoll -le 15){"Stairs to gallery are at the end of the passage."}else{"Stairs to gallery are at the beginning of the passage."})"}
            #Above" "In the former case if a stairway is indicated in or adjacent to the passage it will replace the end stairs 50% (1-10) of the time and supplement 50% (11-20) of the time." is too highly situational at this time to program. Maybe later.
            13 {$SpecificSpecial = "10', streams bisect the passage$(if($SpecificSpecialRoll -le 15){". Bridges cross them."})"}
            14 {$SpecificSpecial = "10', streams bisect the passage$(if($SpecificSpecialRoll -le 15){". Bridges cross them."})"}
            15 {$SpecificSpecial = "10', streams bisect the passage$(if($SpecificSpecialRoll -le 15){". Bridges cross them."})"}
            16 {$SpecificSpecial = "20', rivers bisect the passage$(if($SpecificSpecialRoll -le 10){". Bridges cross them."}elseif(($SpecificSpecialRoll -ge 11) -and ($SpecificSpecialRoll -le 15)){" A boat is present$(if((Get-Random -Minimum 1 -Maximum 3) -eq 1){" on the near shore."}else{" on the far shore."})"})"}
            17 {$SpecificSpecial = "20', rivers bisect the passage$(if($SpecificSpecialRoll -le 10){". Bridges cross them."}elseif(($SpecificSpecialRoll -ge 11) -and ($SpecificSpecialRoll -le 15)){" A boat is present$(if((Get-Random -Minimum 1 -Maximum 3) -eq 1){" on the near shore."}else{" on the far shore."})"})"}
            18 {$SpecificSpecial = "40', rivers bisect the passage$(if($SpecificSpecialRoll -le 10){". Bridges cross them."}elseif(($SpecificSpecialRoll -ge 11) -and ($SpecificSpecialRoll -le 15)){" A boat is present$(if((Get-Random -Minimum 1 -Maximum 3) -eq 1){" on the near shore."}else{" on the far shore."})"})"}
            19 {$SpecificSpecial = "60', rivers bisect the passage$(if($SpecificSpecialRoll -le 10){". Bridges cross them."}elseif(($SpecificSpecialRoll -ge 11) -and ($SpecificSpecialRoll -le 15)){" A boat is present$(if((Get-Random -Minimum 1 -Maximum 3) -eq 1){" on the near shore."}else{" on the far shore."})"})"}
            20 {$SpecificSpecial = "20', chasms ($(((Get-D6Roll).Result * 10) + 140)' deep) bisect the passage$(if($SpecificSpecialRoll -le 10){". Bridges cross them."}elseif(($SpecificSpecialRoll -ge 11) -and ($SpecificSpecialRoll -le 15)){" There is a place to jump across $((Get-Random -Minimum 1 -Maximum 3) * 5)' wide."})"}

        }

    }

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table3B.($Roll).Description
        SpecificSpecial = $SpecificSpecial
   
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
#(Roll for Shape, Size, and Exits; then Contents, Treasure, and how the latter i s contained, if applicable.)
$Table5 = @{

1  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x 20'";Width = 20;Length = 20;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 10' x 10'";Width = 10;Length = 10;Shape="Square"}}
2  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x 20'";Width = 20;Length = 20;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 10' x 10'";Width = 10;Length = 10;Shape="Square"}}
3  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x 20'";Width = 20;Length = 20;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 20' x 20'";Width = 20;Length = 20;Shape="Square"}}
4  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 20'x 20'";Width = 20;Length = 20;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 20' x 20'";Width = 20;Length = 20;Shape="Square"}}
5  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 30'x 30'";Width = 30;Length = 30;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 30' x 30'";Width = 30;Length = 30;Shape="Square"}}
6  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 30'x 30'";Width = 30;Length = 30;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 30' x 30'";Width = 30;Length = 30;Shape="Square"}}
7  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 40'x 40'";Width = 40;Length = 40;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 40' x 40'";Width = 40;Length = 40;Shape="Square"}}
8  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Square, 40'x 40'";Width = 40;Length = 40;Shape="Square"};Room=[pscustomobject]@{Description="Room Shape and Area: Square, 40' x 40'";Width = 40;Length = 40;Shape="Square"}}
9  = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 10' x 20'";Width = 10;Length = 20;Shape="Rectangular"}}
10 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 10' x 20'";Width = 10;Length = 20;Shape="Rectangular"}}
11 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"}}
12 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"}}
13 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 30'";Width = 20;Length = 30;Shape="Rectangular"}}
14 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 30' x 50'";Width = 30;Length = 50;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 40'";Width = 20;Length = 40;Shape="Rectangular"}}
15 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 30' x 50'";Width = 30;Length = 50;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 20' x 40'";Width = 20;Length = 40;Shape="Rectangular"}}
16 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 40' x 60'";Width = 40;Length = 60;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 30' x 40'";Width = 30;Length = 40;Shape="Rectangular"}}
17 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Chamber Shape and Area: Rectangular, 40' x 60'";Width = 40;Length = 60;Shape="Rectangular"};Room=[pscustomobject]@{Description="Room Shape and Area: Rectangular, 30' x 40'";Width = 30;Length = 40;Shape="Rectangular"}}
18 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Unusual shape and size - see sub-tables below";Width = "Unusual";Length = "Unusual";Area = "Unusual";Shape="Unusual"};Room=[pscustomobject]@{Description="Unusual shape and size - see sub-tables below";Width = "Unusual";Length = "Unusual";Area = "Unusual";Shape="Unusual"}}
19 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Unusual shape and size - see sub-tables below";Width = "Unusual";Length = "Unusual";Area = "Unusual";Shape="Unusual"};Room=[pscustomobject]@{Description="Unusual shape and size - see sub-tables below";Width = "Unusual";Length = "Unusual";Area = "Unusual";Shape="Unusual"}}
20 = [pscustomobject]@{Chamber=[pscustomobject]@{Description = "Unusual shape and size - see sub-tables below";Width = "Unusual";Length = "Unusual";Area = "Unusual";Shape="Unusual"};Room=[pscustomobject]@{Description="Unusual shape and size - see sub-tables below";Width = "Unusual";Length = "Unusual";Area = "Unusual";Shape="Unusual"}}

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

    $Unusual = $False

    if(($MyInvocation.InvocationName -eq "Get-RoomShapeAndSize") -and ($Type -eq $Null)){$Type = "Room"}
    if(($MyInvocation.InvocationName -eq "Get-ChamberShapeAndSize") -and ($Type -eq $Null)){$Type = "Chamber"}

    if(!$Roll){$Roll = (Get-D20Roll).Result}
    if(!$Type){$Type = @("Chamber","Room")[(Get-Random -Minimum 0 -Maximum 2)];$Unspecified = $True}
   
    if($Roll -ge 18){$Unusual = $True}
    if($Unusual){$5A = (Get-Table5ARoll).Description;$5B = (Get-Table5BRoll).Description}

    [pscustomobject]@{
   
        Roll = $Roll

        Description = if($Type -eq "Room"){

            "$(($Table5.($Roll)).Room.Description)$(if($Unspecified){' (Unspecified)'})"
       
        }else{
       
            "$($Table5.($Roll).Chamber.Description)$(if($Unspecified){' (Unspecified)'})"
           
        }
   
    }

}
#If unspecified, a room or chamber is randomly selected, noted in parentheses, and its data is returned
#Get-Table5Roll -Type Room
#endregion

#region TABLE V. A.: UNUSUAL SHAPE (Roll Separately for Size) (d20)
$Table5A = @{

1  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)";Shape = "Circular"}
2  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)";Shape = "Circular"}
3  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)";Shape = "Circular"}
4  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)";Shape = "Circular"}
5  = [pscustomobject]@{Description = "Circular (1-5 has pool (see TABLE VIII. A. and C. if appropriate), 6-7 has well, 8-10 has shaft, and 1 1-20 is normal.)";Shape = "Circular"}
6  = [pscustomobject]@{Description = "Triangular";Shape = "Triangular"}
7  = [pscustomobject]@{Description = "Triangular";Shape = "Triangular"}
8  = [pscustomobject]@{Description = "Triangular";Shape = "Triangular"}
9  = [pscustomobject]@{Description = "Trapezoidal";Shape = "Trapezoidal"}
10 = [pscustomobject]@{Description = "Trapezoidal";Shape = "Trapezoidal"}
11 = [pscustomobject]@{Description = "Trapezoidal";Shape = "Trapezoidal"}
12 = [pscustomobject]@{Description = "Odd-shaped (Draw what shape you desire or what will fit the map - it is a special shape if desired)";Shape = "Odd-shaped"}
13 = [pscustomobject]@{Description = "Odd-shaped (Draw what shape you desire or what will fit the map - it is a special shape if desired)";Shape = "Odd-shaped"}
14 = [pscustomobject]@{Description = "Oval";Shape = "Oval"}
15 = [pscustomobject]@{Description = "Oval";Shape = "Oval"}
16 = [pscustomobject]@{Description = "Hexagonal";Shape = "Hexagonal"}
17 = [pscustomobject]@{Description = "Hexagonal";Shape = "Hexagonal"}
18 = [pscustomobject]@{Description = "Octagonal";Shape = "Octagonal"}
19 = [pscustomobject]@{Description = "Octagonal";Shape = "Octagonal"}
20 = [pscustomobject]@{Description = "Cave";Shape = "Cave"}

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

1  = [pscustomobject]@{Description = "About 500 sq. ft.";Area = 500}
2  = [pscustomobject]@{Description = "About 500 sq. ft.";Area = 500}
3  = [pscustomobject]@{Description = "About 500 sq. ft.";Area = 500}
4  = [pscustomobject]@{Description = "About 900 sq. ft.";Area = 900}
5  = [pscustomobject]@{Description = "About 900 sq. ft.";Area = 900}
6  = [pscustomobject]@{Description = "About 900 sq. ft.";Area = 900}
7  = [pscustomobject]@{Description = "About 1,300 sq. ft.";Area = 1300}
8  = [pscustomobject]@{Description = "About 1,300 sq. ft.";Area = 1300}
9  = [pscustomobject]@{Description = "About 2,000 sq. ft.";Area = 2000}
10 = [pscustomobject]@{Description = "About 2,000 sq. ft.";Area = 2000}
11 = [pscustomobject]@{Description = "About 2,700 sq. ft.";Area = 2700}
12 = [pscustomobject]@{Description = "About 2,700 sq. ft.";Area = 2700}
13 = [pscustomobject]@{Description = "About 3,400 sq. ft.";Area = 3400}
14 = [pscustomobject]@{Description = "About 3,400 sq. ft.";Area = 3400}
15 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-10 above, and so on)";Area = "Special"}
16 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-10 above, and so on)";Area = "Special"}
17 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-10 above, and so on)";Area = "Special"}
18 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-10 above, and so on)";Area = "Special"}
19 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-10 above, and so on)";Area = "Special"}
20 = [pscustomobject]@{Description = "Roll again and add result to 9-10 above (if another 15-20 repeat the process, doubling 9-10 above, and so on)";Area = "Special"}

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
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [bool]$DeadEnd
   
    )

    if($DeadEnd -eq $True){$Roll = Get-Random -Minimum 1 -Maximum 18}
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

    if($Roll -eq 18){

        $SpecialDieRoll = (Get-D20Roll).Result

        switch($SpecialDieRoll){
        
                1 {$Stairs = "Stairs up 1 level"}
                2 {$Stairs = "Stairs up 1 level"}
                3 {$Stairs = "Stairs up 1 level"}
                4 {$Stairs = "Stairs up 1 level"}
                5 {$Stairs = "Stairs up 1 level"}
                #6 is a missing result in the DMG! I have included it as "Stairs up 2 levels".
                6 {$Stairs = "Stairs up 2 levels"}
                7 {$Stairs = "Stairs up 2 levels"}
                8 {$Stairs = "Stairs up 2 levels"}
                9 {$Stairs = "Stairs down 1 level"}
                10 {$Stairs = "Stairs down 1 level"}
                11 {$Stairs = "Stairs down 1 level"}
                12 {$Stairs = "Stairs down 1 level"}
                13 {$Stairs = "Stairs down 1 level"}
                14 {$Stairs = "Stairs down 1 level"}
                15 {$Stairs = "Stairs down 2 levels"}
                16 {$Stairs = "Stairs down 2 levels"}
                17 {$Stairs = "Stairs down 2 levels"}
                18 {$Stairs = "Stairs down 2 levels"}
                19 {$Stairs = "Stairs down 2 levels"}
                20 {$Stairs = "Stairs down 3 levels"}

        }

    }

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5F.($Roll).Description
        Stairs = if($Stairs){$Stairs}else{"N/A"}
   
    }

}
#endregion

#region TABLE V. G.: TREASURE* (d%)
#*See also TABLES V. H. and I. or J.
$Table5G = @(

[pscustomobject]@{Min = 1;Max = 25;NoMonster = [pscustomobject]@{Description='1,000 copper pieces/level';Currency=[pscustomobject]@{Amount=1000;Type='Copper pieces';Value=10}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 26;Max = 50;NoMonster = [pscustomobject]@{Description='1,000 silver pieces/level';Currency=[pscustomobject]@{Amount=1000;Type='Silver pieces';Value=100}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 51;Max = 65;NoMonster = [pscustomobject]@{Description='750 electrum pieces/level';Currency=[pscustomobject]@{Amount=750;Type='Electrum pieces';Value=375}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 66;Max = 80;NoMonster = [pscustomobject]@{Description='250 gold pieces/level';Currency=[pscustomobject]@{Amount=250;Type='Gold pieces';Value=250}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 81;Max = 90;NoMonster = [pscustomobject]@{Description='100 platinum pieces/level';Currency=[pscustomobject]@{Amount=100;Type='Platinum pieces';Value=500}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 91;Max = 94;NoMonster = [pscustomobject]@{Description='1-4 gems/level';Currency=[pscustomobject]@{Amount=$Null;Type=$Null}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 95;Max = 97;NoMonster = [pscustomobject]@{Description='1 piece jewelry/level';Currency=[pscustomobject]@{Amount=$Null;Type=$Null}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}
[pscustomobject]@{Min = 98;Max = 100;NoMonster = [pscustomobject]@{Description='Magic (roll once on Magic Items Table)';Currency=[pscustomobject]@{Amount=$Null;Type=$Null}};WMonster = [pscustomobject]@{Description='Take two rolls on "Without Monster" Table, add 10% to the total of each roll.'}}

)

function Get-Table5GRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [bool]$Monster,
        [Parameter(Mandatory=$False)]
        [int]$Level
   
    )

    if((!$Level) -or ($Level -eq $Null)){$Level = 1}
    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}
    if($Monster -eq $Null){@($True,$False)[(Get-Random -Minimum 0 -Maximum 2)];$Unspecified = $True}

    $Loot = if($Monster -eq $False){($Table5G | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}).NoMonster.Currency}

    [pscustomobject]@{
   
        Roll = $Roll;
        Monster = $("$Monster$(if($Unspecified){' (Unspecified)'})");
        Description = "$(if($Monster -eq $False){($Table5G | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}).NoMonster.Description}else{($Table5G | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}).WMonster.Description})"
        Loot = [pscustomobject]@{

            Amount = $Loot.Amount * $Level
            Type = $Loot.Type
            Value = $Loot.Value * $Level

        }
   
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
#"Appendix A suggests that 35% of all treasure is guarded by poison." -https://dnd.sinister.net/revisiting-poison/
#Me: Where??

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

    switch($Table5J.($Roll).Description){
   
        "Invisibility" {$Sentence = "Treasure is magically invisible"}
        "Illusion (to change or hide appearance)" {$Sentence = "Treasure is disguised by a magic illusion"}
        "Secret space under container" {$Sentence = "Treasure is in a secret space under its container"}
        "Inside ordinary item in plain view" {$Sentence = "N/A"}
        "Disguised to appear as something else" {$Sentence = "Treasure has been disguised to appear as something else"}
        "Under a heap of trash/dung" {$Sentence = "Treasure is under a heap of $(if((Get-D2Roll).Result -eq 1){'trash'}else{'dung'})"}
        "Under a loose stone in the floor" {$Sentence = "Treasure is under a loose stone in the floor"}
        "Behind a loose stone in the wall" {$Sentence = "Treasure is behind a loose stone in the wall"}
        "In a secret room nearby" {$Sentence = "Treasure is in a secret room nearby"}

   }

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table5J.($Roll).Description
        Sentence = $Sentence
   
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
18 = [pscustomobject]@{Description = "Up 1 then down 2 (total down 1), chamber at end (roll on TABLE V.)"}
19 = [pscustomobject]@{Description = "Up 1 then down 2 (total down 1), chamber at end (roll on TABLE V.)"}
20 = [pscustomobject]@{Description = "Up 1 then down 2 (total down 1), chamber at end (roll on TABLE V.)"}

}
#N.B. Check for such doors only after descending steps if playing solo!

function Get-Table6Roll {

    [alias("Get-Stairs")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll

    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    $SpecificStairs = "N/A"
    $SpecificStairsD20Roll = (Get-D20Roll).Result
    $SpecificStairsD6Roll = (Get-D6Roll).Result

    if($Roll -le 5){$SpecificStairs = "Down 1 level$(if($SpecificStairsD20Roll -eq 1){". Door ahead which closes egress for the day."})"}
    if($Roll -eq 6){$SpecificStairs = "Down 2 levels$(if($SpecificStairsD20Roll -le 2){". Door ahead which closes egress for the day."})"}
    if($Roll -eq 7){$SpecificStairs = "Down 3 levels$(if($SpecificStairsD20Roll -le 3){". Door ahead which closes egress for the day."})"}
    if($Roll -eq 9){$SpecificStairs = "Up, dead end$(if($SpecificStairsD6Roll -eq 1){". Then chute down 2 levels"})"}
    if($Roll -eq 10){$SpecificStairs = "Down, dead end$(if($SpecificStairsD6Roll -eq 1){". Then chute down 1 levels"})"}
    if($Roll -ge 18){$SpecificStairs = "Up 1 then down 2 (total down 1), to chamber."}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table6.($Roll).Description
        SpecificStairs = $SpecificStairs
   
    }

}
#endregion

#region TABLE VII.: TRICK/TRAP (d20)
$Table7 = @{

1  = [pscustomobject]@{Description = "Secret Door: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.); If secret door is undetected then pit, 10' deep, 3 in 6 to fall in."}
2  = [pscustomobject]@{Description = "Secret Door: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.); If secret door is undetected then pit, 10' deep, 3 in 6 to fall in."}
3  = [pscustomobject]@{Description = "Secret Door: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.); If secret door is undetected then pit, 10' deep, 3 in 6 to fall in."}
4  = [pscustomobject]@{Description = "Secret Door: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.); If secret door is undetected then pit, 10' deep, 3 in 6 to fall in."}
5  = [pscustomobject]@{Description = "Secret Door: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.); If secret door is undetected then pit, 10' deep, 3 in 6 to fall in."}
6  = [pscustomobject]@{Description = "Pit, 10' deep, 3 in 6 to fall in."}
7  = [pscustomobject]@{Description = "Pit, 10' deep, 3 in 6 to fall in."}
8  = [pscustomobject]@{Description = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
9  = [pscustomobject]@{Description = "20' x 20' elevator room (party has entered door directly ahead and is in room), descends 1 level and will not ascend for 30 turns."}
10 = [pscustomobject]@{Description = "20' x 20' elevator room (party has entered door directly ahead and is in room), descends 2 levels and will not ascend for 30 turns."}
11 = [pscustomobject]@{Description = "20' x 20' elevator room (party has entered door directly ahead and is in room), descends 2-5 levels; 1 upon entering and 1 additional level each time an unsuccessful attempt at door opening is made, or until it descends as far as it can. This will not ascend for 60 turns."}
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
#I changed wording above!
#Result 1-5 originally read "Secret Door unless unlocated: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20 (then see TABLE II.). Unlocated secret doors go to die 6,7 below."
#Result 10 originally read "As 9.above, but room descends 2 levels" and result 11 originally read "As above, but room descends 2-5 levels - 1 upon entering and 1 additional level each time an unsuccessful attempt at door opening is made, or until it descends as far as it can. This will not ascend for 60 turns."

function Get-Table7Roll {

    [alias("Get-Trick","Get-Track","Get-TrickOrTrack")]
    param(
   
        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = (Get-D20Roll).Result}

    $SecretDoorTrap = "N/A"
    $IllusionaryWallHides = "N/A"
    $Gas = "N/A"
    $Arrows = "N/A"
    $Spear = "N/A"
    $Blocking = "N/A"
    $Crush = "N/A"

    #To do: Add a roll for table II (maps) for results 1-5 above

    if($Roll -le 5){$SecretDoorTrap = "Secret Door: Non-elf locates 3 in 20, elf locates 5 in 20, magical device locates 18 in 20; If secret door is not detected then pit, 10' deep, 3 in 6 to fall in."}

    if($Roll -eq 12){$Blocking = "Wall 10' behind slides across passage blocking it for $(Get-Random -Minimum 40 -Maximum 61) turns."}

    if($Roll -eq 14){$Crush = "Pit, 10' deep, 3 in 6 to fall in, pit walls move together to crush victim(s) in $((Get-D4Roll).Result + 1) rounds."}

    if($Roll -eq 15){$ArrowNumber = Get-Random -Minimum 1 -Maximum 4;$PoisonedArrowNumber = 0;1..$ArrowNumber | %{if((Get-D20Roll).Result -eq 1){$PoisonedArrowNumber++}};$Arrows = "Arrow trap: $($ArrowNumber) arrow$(if($ArrowNumber -gt 1){"s"})$(if($PoisonedArrowNumber -gt 1){", $($PoisonedArrowNumber) are poisoned"}elseif($PoisonedArrowNumber -eq 1){", 1 is poisoned"})."}

    if($Roll -eq 16){$SpearNumber = Get-Random -Minimum 1 -Maximum 4;$PoisonedSpearNumber = 0;1..$SpearNumber | %{if((Get-D20Roll).Result -eq 1){$PoisonedSpearNumber++}};$Spear = "Spear trap: $($SpearNumber) spear$(if($SpearNumber -gt 1){"s"})$(if($PoisonedSpearNumber -gt 1){", $($PoisonedSpearNumber) are poisoned"}elseif($PoisonedSpearNumber -eq 1){", 1 is poisoned"})."}

    if($Roll -eq 17){$Gas = "Gas: $((Get-Gas).Description) Party has detected it, but must breathe it to continue along corridor, as it covers 60' ahead. Mark map accordingly regardless of turning back or not."}

    if($Roll -eq 19){
    
        switch((Get-D20Roll).Result){

            1 {$IllusionaryWallHides = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
            2 {$IllusionaryWallHides = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
            3 {$IllusionaryWallHides = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
            4 {$IllusionaryWallHides = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
            5 {$IllusionaryWallHides = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
            6 {$IllusionaryWallHides = "Pit, 10' deep with spikes, 3 in 6 to fall in."}
            7 {$IllusionaryWallHides = "Chute down 1 level"}
            8 {$IllusionaryWallHides = "Chute down 1 level"}
            9 {$IllusionaryWallHides = "Chute down 1 level"}
            10 {$IllusionaryWallHides = "Chute down 1 level"}
            11 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            12 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            13 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            14 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            15 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            16 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            17 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            18 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            19 {$IllusionaryWallHides = "Chamber with monster and treasure"}
            20 {$IllusionaryWallHides = "Chamber with monster and treasure"}

        }

    }

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table7.($Roll).Description
        Specific = "$(if($IllusionaryWallHides -notlike "N/A"){$IllusionaryWallHides}elseif($Gas -notlike "N/A"){$Gas}elseif($Arrows -notlike "N/A"){$Arrows}elseif($Spear -notlike "N/A"){$Spear}elseif($Blocking -notlike "N/A"){$Blocking}elseif($Crush -notlike "N/A"){$Crush}elseif($SecretDoorTrap -notlike "N/A"){$SecretDoorTrap}else{$Table7.($Roll).Description})"
        IllusionaryWall = $IllusionaryWallHides
        Gas = $Gas
        SecretDoorTrap = $SecretDoorTrap
   
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
8  = [pscustomobject]@{Description = "Blinds for 1-6 turns after passing through."}
9  = [pscustomobject]@{Description = "Blinds for 1-6 turns after passing through."}
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
13 = [pscustomobject]@{Description = "Pool, monster & treasure"}
14 = [pscustomobject]@{Description = "Pool, monster & treasure"}
15 = [pscustomobject]@{Description = "Pool, monster & treasure"}
16 = [pscustomobject]@{Description = "Pool, monster & treasure"}
17 = [pscustomobject]@{Description = "Pool, monster & treasure"}
18 = [pscustomobject]@{Description = "Pool, monster & treasure"}
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

    $TransporterPoolRoll = ''
    $AddSub = ''
    $AlignmentRoll = ''
    if(!$Roll){$Roll = (Get-D20Roll).Result}

    if($Table8C.($Roll).Description -like "Turns gold to platinum*"){$PoolSpecificScenario=if((Get-D20Roll).Result -le 11){"Turns gold to platinum, one time only."}else{"Turns gold to lead, one time only."}}
    if($Table8C.($Roll).Description -like "Will, on a one-time only basis, add*"){$PoolSpecificScenario="Will, on a one-time only basis, $(if((Get-D6Roll).Result -le 3){$AddSub="add"}else{$AddSub="subtract"};$AddSub) $(Get-Random -Minimum 1 -Maximum 4) $(if($AddSub -like "add"){"to"}else{"from"}) $(switch((Get-D6Roll).Result){1{"Strength"};2{"Intelligence"};3{"Wisdom"};4{"Dexterity"};5{"Constitution"};6{"Charisma"}}) of all who stand within it."}
    if($Table8C.($Roll).Description -like "Talking pool which will*"){$AlignmentRoll=(Get-D20Roll).Result;if(($AlignmentRoll -ge 1) -and ($AlignmentRoll -le 6)){$PoolAlignment = "lawful good"}elseif(($AlignmentRoll -ge 7) -and ($AlignmentRoll -le 9)){$PoolAlignment = "lawful evil"}elseif(($AlignmentRoll -ge 10) -and ($AlignmentRoll -le 12)){$PoolAlignment = "chaotic good"}elseif(($AlignmentRoll -ge 18) -and ($AlignmentRoll -le 20)){$PoolAlignment = "neutral"};$PoolSpecificScenario="Talking pool which will grant 1 wish to characters of its alignment and damage others from 1-20 points. Wish can be withheld for up to 1 day. Pool's alignment is: $($PoolAlignment)"}
    if($Table8C.($Roll).Description -like "Transporter pool*"){$TransporterPoolRoll=(Get-D20Roll).Result;$PoolSpecificScenario=if($TransporterPoolRoll -le 7){"Transporter pool: back to surface"}elseif(($TransporterPoolRoll -ge 8) -and ($TransporterPoolRoll -le 12)){"Transporter pool: elsewhere on level"}elseif(($TransporterPoolRoll -ge 13) -and ($TransporterPoolRoll -le 16)){"Transporter pool: 1 level down"}elseif($TransporterPoolRoll -ge 17){"Transporter pool: 100 miles away for outdoor adventure"}}

    [pscustomobject]@{
   
        Roll = $Roll;
        Description = $Table8C.($Roll).Description
        PoolSpecificScenario = $PoolSpecificScenario
   
    }

}
#endregion

#endregion

#region Gem tables

$Gems = @(

[pscustomobject]@{Min = 1;Max = 25;BaseValue=10;Description="Ornamental";Size="Very small";Class = 1}
[pscustomobject]@{Min = 26;Max = 50;BaseValue=50;Description="Semi-precious";Size="Small";Class = 2}
[pscustomobject]@{Min = 51;Max = 70;BaseValue=100;Description="Fancy";Size="Average";Class = 3}
[pscustomobject]@{Min = 71;Max = 90;BaseValue=500;Description="Precious";Size="Large";Class = 4}
[pscustomobject]@{Min = 91;Max = 99;BaseValue=1000;Description="Gem";Size="Very Large";Class = 5}
[pscustomobject]@{Min = 100;Max = 100;BaseValue=5000;Description="Jewel";Size="Huge";Class = 6}

)

function Get-GemTableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $Gems | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    }

}

$GemModifier = @{

1  = [pscustomobject]@{Description = "Stone increases to next higher base value; roll again ignoring results above 8. Stones above 5,000 gold piece value progress as follows: 10,000 GP, 25,000 GP, 50,000GP, 100,000 GP, 250,000 GP, 500,000 GP, and 1,000,000GP- the absolute maximum. No stone may increase beyond 7 places from its initial base value."}
2  = [pscustomobject]@{Description = "Stone is double base value. Do not roll again."}
3  = [pscustomobject]@{Description = "Stone is 10% to 60% above base value. Roll d6 to find new value. Do not roll again on this table."}
4  = [pscustomobject]@{Description = "Base value shown is unchanged."}
5  = [pscustomobject]@{Description = "Base value shown is unchanged."}
6  = [pscustomobject]@{Description = "Base value shown is unchanged."}
7  = [pscustomobject]@{Description = "Base value shown is unchanged."}
8  = [pscustomobject]@{Description = "Base value shown is unchanged."}
9  = [pscustomobject]@{Description = "Stone is 10% to 40% below base value. Roll d4 to find new value. Do not roll again on this table."}
10  = [pscustomobject]@{Description = "Stone decreases to next lower base value; roll again on this table, ignoring any result below 2. Stones below 10 gold piece value are: 5 GP, 1 GP, 10 SP, 5 SP, and 1 SP. No stone may decrease beyond 5 places from its initial base value."}

}
#When base value only is known, use the table above

function Get-GemModifierRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = (Get-D10Roll).Result}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $GemModifier.($Roll).Description

    }

}

$OrnamentalStones = @{

1 = [pscustomobject]@{Stone = "Azurite";Description = "Opaque and mottled deep blue";ReputedMagicalProperty="-";Value = 10}
2 = [pscustomobject]@{Stone = "Banded Agate";Description = "Translucent and striped brown and blue and white and reddish";ReputedMagicalProperty="Restful and safe sleep";Value = 10}
3 = [pscustomobject]@{Stone = "Blue Quartz";Description = "Pale blue";ReputedMagicalProperty="-";Value = 10}
4 = [pscustomobject]@{Stone = "Eye Agate";Description = "Translucent with circles of gray, white, brown, blue and/or green";ReputedMagicalProperty="Restful and safe sleep";Value = 10}
5 = [pscustomobject]@{Stone = "Hematite";Description = "Opaque and gray-black";ReputedMagicalProperty="Aids fighters, heals wounds";Value = 10}
6 = [pscustomobject]@{Stone = "Lapis Lazuli";Description = "Opaque and light and dark blue with yellow flecks";ReputedMagicalProperty="Raises morale, courage";Value = 10}
7 = [pscustomobject]@{Stone = "Malachite";Description = "Opaque and striated light and dark green";ReputedMagicalProperty="Protection from falling, Wards off spells, evil spirits, and poisons";Value = 10}
8 = [pscustomobject]@{Stone = "Moss Agate";Description = "Pink or yellow-white with grayish or greenish `"moss markings`"";ReputedMagicalProperty="Restful and safe sleep";Value = 10}
9 = [pscustomobject]@{Stone = "Obsidian";Description = "Opaque and black";ReputedMagicalProperty="-";Value = 10}
10 = [pscustomobject]@{Stone = "Rhodochrosite";Description = "Opaque and light pink";ReputedMagicalProperty="-";Value = 10}
11 = [pscustomobject]@{Stone = "Tiger Eye";Description = "Rich brown with golden center under-hue";ReputedMagicalProperty="-";Value = 10}
12 = [pscustomobject]@{Stone = "Turquoise";Description = "Opaque and light blue-green";ReputedMagicalProperty="Aids horses in all ways (but stone shatters when it operates)";Value = 10}

}

function Get-OrnamentalStone {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = (Get-D12Roll).Result}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $OrnamentalStones.($Roll)

    }

}

$SemiPreciousStones = @{

1  = [pscustomobject]@{Stone = "Bloodstone";Description = "Opaque and dark gray with red flecks";ReputedMagicalProperty="Weather control";Value = 50}
2  = [pscustomobject]@{Stone = "Carnelian";Description = "Opaque and orange to reddish brown (also called Sard)";ReputedMagicalProperty="Protection from evil";Value = 50}
3  = [pscustomobject]@{Stone = "Chalcedony";Description = "Opaque and white";ReputedMagicalProperty="Wards off undead";Value = 50}
4  = [pscustomobject]@{Stone = "Chrysoprase";Description = "Translucent and apple green to emerald green";ReputedMagicalProperty="Invisibility";Value = 50}
5  = [pscustomobject]@{Stone = "Citrine";Description = "Pale yellow brown";ReputedMagicalProperty="Invisibility";Value = 50}
6  = [pscustomobject]@{Stone = "Jasper";Description = "Opaque and blue, black to brown";ReputedMagicalProperty="Protection from venom";Value = 50}
7  = [pscustomobject]@{Stone = "Moonstone";Description = "Translucent and white with pale blue glow";ReputedMagicalProperty="Causes lycanthropy";Value = 50}
8  = [pscustomobject]@{Stone = "Onyx";Description = "Opaque and has bands of black and white or pure black or white";ReputedMagicalProperty="Causes discord amongst enemies";Value = 50}
9  = [pscustomobject]@{Stone = "Rock Crystal";Description = "Clear";ReputedMagicalProperty="Causes discord amongst enemies";Value = 50}
10  = [pscustomobject]@{Stone = "Sardonyx";Description = "Opaque with bands of red sard and white onyx or brown sard";ReputedMagicalProperty="Protection from evil and causes discord amongst enemies";Value = 50}
11  = [pscustomobject]@{Stone = "Smoky Quartz";Description = "Light gray, yellow, or blue (Cairngorm)";ReputedMagicalProperty="-";Value = 50}
12  = [pscustomobject]@{Stone = "Star Rose Quartz";Description = "Translucent rosy color with a white `"star`" center";ReputedMagicalProperty="-";Value = 50}
13  = [pscustomobject]@{Stone = "Zircon";Description = "Clear pale blue-green ";ReputedMagicalProperty="-";Value = 50}

}

function Get-SemiPreciousStone {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = Get-Random -Minimum 1 -Maximum 14}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $SemiPreciousStones.($Roll)

    }

}

$FancyStones = @{

1  = [pscustomobject]@{Stone = "Amber";Description = "Watery gold to rich gold";ReputedMagicalProperty = "Wards off diseases";Value = 100}
2  = [pscustomobject]@{Stone = "Alexandrite";Description = "Dark green";ReputedMagicalProperty = "Good omens";Value = 100}
3  = [pscustomobject]@{Stone = "Amethyst";Description = "Deep purple";ReputedMagicalProperty = "Prevents drunkenness or drugging";Value = 100}
4  = [pscustomobject]@{Stone = "Aquamarine";Description = "Pale blue green";ReputedMagicalProperty = "Wards off foes";Value = 500}
5  = [pscustomobject]@{Stone = "Chrysoberyl";Description = "Yellow green to green";ReputedMagicalProperty = "Protection from possession";Value = 100}
6  = [pscustomobject]@{Stone = "Coral";Description = "Opaque and crimson";ReputedMagicalProperty = "Calms weather, safety in river crossing, cures madness, stanches bleeding";Value = 100}
7  = [pscustomobject]@{Stone = "Garnet";Description = "Red or brown-green";ReputedMagicalProperty = "-";Value = 100}
8  = [pscustomobject]@{Stone = "Jade";Description = "Light green, deep green, green and white, white";ReputedMagicalProperty = "Skill at music and musical instruments";Value = 100}
9  = [pscustomobject]@{Stone = "Jet";Description = "Opaque and deep black";ReputedMagicalProperty = "-";Value = 100}
10  = [pscustomobject]@{Stone = "Pearl";Description = "Opaque and lustrous white, yellowish, pinkish, etc.";ReputedMagicalProperty = "-";Value = 100}
11  = [pscustomobject]@{Stone = "Peridot";Description = "Rich olive green (Chrysolite)";ReputedMagicalProperty = "Wards off enchantments / Wards off spells (Chrysolite)";Value = 500}
12  = [pscustomobject]@{Stone = "Spinel";Description = "Red, red-brown, or deep green";ReputedMagicalProperty = "-";Value = 100}
13  = [pscustomobject]@{Stone = "Topaz";Description = "Golden yellow";ReputedMagicalProperty = "Wards off evil spells";Value = 500}
14  = [pscustomobject]@{Stone = "Tourmaline";Description = "Green pale, blue pale, brown pale, or reddish pale";ReputedMagicalProperty = "-";Value = 100}

}

function Get-FancyStone {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = Get-Random -Minimum 1 -Maximum 15}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $FancyStones.($Roll)

    }

}

$FancyPreciousStones = @{

1  = [pscustomobject]@{Stone = "Aquamarine";Description = "Pale blue green";ReputedMagicalProperty = "Wards off foes";Value = 500}
2  = [pscustomobject]@{Stone = "Garnet";Description = "Violet";ReputedMagicalProperty = "-";Value = 500}
3  = [pscustomobject]@{Stone = "Pearl";Description = "Opaque and pure black";ReputedMagicalProperty = "-";Value = 500}
4  = [pscustomobject]@{Stone = "Peridot";Description = "Rich olive green (Chrysolite)";ReputedMagicalProperty = "Wards off enchantments / Wards off spells (Chrysolite)";Value = 500}
5  = [pscustomobject]@{Stone = "Spinel";Description = "Very deep blue";ReputedMagicalProperty = "-";Value = 500}
6  = [pscustomobject]@{Stone = "Topaz";Description = "Golden yellow";ReputedMagicalProperty = "Wards off evil spells";Value = 500}

}
#The above is my interpretation of a table that is implied by the "Gems" table, results 71 - 90

function Get-FancyPreciousStone {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = Get-Random -Minimum 1 -Maximum 7}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $FancyPreciousStones.($Roll)

    }

}

$GemStones = @{

1  = [pscustomobject]@{Stone = "Black Opal";Description = "Translucent dark green with black mottling and golden flecks";ReputedMagicalProperty = "-";Value = 1000}
2  = [pscustomobject]@{Stone = "Black Sapphire";Description = "Translucent lustrous black with glowing highlights";ReputedMagicalProperty = "Aids understanding of problems, kills spiders, boosts magical abilities";Value = 5000}
3  = [pscustomobject]@{Stone = "Diamond";Description = "Clear blue-white with lesser stones clear white or pale tints";ReputedMagicalProperty = "Invulnerability vs. undead";Value = 5000}
4  = [pscustomobject]@{Stone = "Emerald";Description = "Deep bright green ";ReputedMagicalProperty = "Wards off foes";Value = 1000}
5  = [pscustomobject]@{Stone = "Fire Opal";Description = "Translucent fiery red";ReputedMagicalProperty = "-";Value = 1000}
6  = [pscustomobject]@{Stone = "Jacinth";Description = "Fiery orange (Corundum)";ReputedMagicalProperty = "Luck travelling, wards off plague, protection from fire";Value = 5000}
7  = [pscustomobject]@{Stone = "Opal";Description = "Translucent pale blue with green and golden mottling";ReputedMagicalProperty = "-";Value = 1000}
8  = [pscustomobject]@{Stone = "Oriental Amethyst";Description = "Rich purple (Corundum)";ReputedMagicalProperty = "Prevents drunkenness or drugging";Value = 1000}
9  = [pscustomobject]@{Stone = "Oriental Emerald";Description = "Clear bright green (Corundum)";ReputedMagicalProperty = "-";Value = 5000}
10  = [pscustomobject]@{Stone = "Oriental Topaz";Description = "Clear fiery yellow (Corundum)";ReputedMagicalProperty = "Wards off evil spells";Value = 1000}
11  = [pscustomobject]@{Stone = "Ruby";Description = "Clear red to deep crimson (Corundum)";ReputedMagicalProperty = "Gives good luck";Value = 5000}
12  = [pscustomobject]@{Stone = "Sapphire";Description = "Clear to medium blue (Corundum)";ReputedMagicalProperty = "Aids understanding of problems, kills spiders, boosts magical abilities";Value = 1000}
13  = [pscustomobject]@{Stone = "Star Ruby";Description = "Translucent ruby with white `"star`" center";ReputedMagicalProperty = "Gives good luck";Value = 1000}
14  = [pscustomobject]@{Stone = "Star Sapphire";Description = "Translucent sapphire with white `"star`" center";ReputedMagicalProperty = "Aids understanding of problems, kills spiders, boosts magical abilities";Value = 1000}

}

function Get-GemStone {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = Get-Random -Minimum 1 -Maximum 15}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $GemStones.($Roll)

    }

}

$Jewels = @{

1  = [pscustomobject]@{Stone = "Black Sapphire";Description = "Translucent lustrous black with glowing highlights";ReputedMagicalProperty = "Aids understanding of problems, kills spiders, boosts magical abilities";Value = 5000}
2  = [pscustomobject]@{Stone = "Diamond";Description = "Clear blue-white with lesser stones clear white or pale tints";ReputedMagicalProperty = "Invulnerability vs. undead";Value = 5000}
3  = [pscustomobject]@{Stone = "Jacinth";Description = "Fiery orange (Corundum)";ReputedMagicalProperty = "Luck travelling, wards off plague, protection from fire";Value = 5000}
4  = [pscustomobject]@{Stone = "Oriental Emerald";Description = "Clear bright green (Corundum)";ReputedMagicalProperty = "-";Value = 5000}
5  = [pscustomobject]@{Stone = "Ruby";Description = "Clear red to deep crimson (Corundum)";ReputedMagicalProperty = "Gives good luck";Value = 5000}

}
#The above is my interpretation of a table that is implied by the "Gems" table, result 00

function Get-Jewel {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = Get-Random -Minimum 1 -Maximum 6}

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $Jewels.($Roll)

    }

}

#endregion

#region Jewelry tables

$Jewelry = @(

[pscustomobject]@{Min = 1;Max = 10;BaseValue = 100;TopValue = 1000;Description = "Ivory or wrought silver";VarianceDie = 6;VarianceValue = 150;Class = 1;Material = @("Ivory","Wrought silver");Gems = $False}
[pscustomobject]@{Min = 11;Max = 20;BaseValue = 200;TopValue = 1200;Description = "Wrought silver and gold";VarianceDie = 10;VarianceValue = 100;Class = 2;Material = @("Wrought silver and gold");Gems = $False}
[pscustomobject]@{Min = 21;Max = 40;BaseValue = 300;TopValue = 1800;Description = "Wrought gold";VarianceDie = 6;VarianceValue = 250;Class = 3;Material = @("Wrought gold");Gems = $False}
[pscustomobject]@{Min = 41;Max = 50;BaseValue = 500;TopValue = 3000;Description = "Jade, coral or wrought platinum";VarianceDie = 10;VarianceValue = 250;Class = 4;Material = @("Jade","Coral","Wrought Platinum");Gems = $False}
[pscustomobject]@{Min = 51;Max = 70;BaseValue = 1000;TopValue = 6000;Description = "Silver with gems";VarianceDie = 8;VarianceValue = 625;Class = 5;Material = @("Silver");Gems = $True}
[pscustomobject]@{Min = 71;Max = 90;BaseValue = 2000;TopValue = 8000;Description = "Gold with gems";VarianceDie = 6;VarianceValue = 1000;Class = 6;Material = @("Gold");Gems = $True}
[pscustomobject]@{Min = 91;Max = 100;BaseValue = 2000;TopValue = 12000;Description = "Platinum with gems";VarianceDie = 8;VarianceValue = 1250;Class = 7;Material = @("Platinum");Gems = $True}

)
#I had to guess how to determine a specific value for a value in the DMG, as no explicit explanation is given, (as usual!). I chose the smallest die that would cleanly divide the variance provided in the book, (pg. 26).

function Get-JewelryTableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $Result = $Jewelry | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}
    $Material = $Result.Material[(Get-Random -Minimum 0 ($Result.Material.Count))]

    [pscustomobject]@{
    
        Roll = $Roll
        Result = $Result
        Material = $Material

    }

}

$JewelryPieces = @{

    1  = [pscustomobject]@{Description = "Bracelet"}
    2  = [pscustomobject]@{Description = "Brooch"}
    3  = [pscustomobject]@{Description = "Crown"}
    4  = [pscustomobject]@{Description = "Earrings"}
    5  = [pscustomobject]@{Description = "Necklace"}
    6  = [pscustomobject]@{Description = "Pendant"}
    7  = [pscustomobject]@{Description = "Ring"}
    8  = [pscustomobject]@{Description = "Tiara"}

}
#The above is not a table in the DMG per se, but is mentioned in the text discussing jewelry: "The Dungeon Master can, of course, name what each piece of jewelry is (bracelet, brooch, crown, earrings, necklace, pendant, ring, tiara, etc.),giving its substance and the number and value of its stones." (pg. 26)

function Get-JewelryPieceRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = (Get-D8Roll).Result}

    [pscustomobject]@{

        Description = $JewelryPieces.($Roll).Description

    }

}

#endregion

#region Magic Items

$MagicItemType = @(

[pscustomobject]@{Min = 1;Max = 20;Type = "Potions (A.)";ShortName = "Potion"}
[pscustomobject]@{Min = 21;Max = 35;Type = "Scrolls (B.)";ShortName = "Scroll"}
[pscustomobject]@{Min = 36;Max = 40;Type = "Rings (C.)";ShortName = "Magic ring"}
[pscustomobject]@{Min = 41;Max = 45;Type = "Rods, Staves & Wands (D.)";ShortName = "Magic wand"}
[pscustomobject]@{Min = 46;Max = 48;Type = "Miscellaneous Magic (E.1.)";ShortName = "Wonderous item"}
[pscustomobject]@{Min = 49;Max = 51;Type = "Miscellaneous Magic (E.2.)";ShortName = "Wonderous item"}
[pscustomobject]@{Min = 52;Max = 54;Type = "Miscellaneous Magic (E.3.)";ShortName = "Wonderous item"}
[pscustomobject]@{Min = 55;Max = 57;Type = "Miscellaneous Magic (E.4.)";ShortName = "Wonderous item"}
[pscustomobject]@{Min = 58;Max = 60;Type = "Miscellaneous Magic (E.5.)";ShortName = "Wonderous item"}
[pscustomobject]@{Min = 61;Max = 75;Type = "Armor & Shields (F.)";ShortName = "Magic armor"}
[pscustomobject]@{Min = 76;Max = 86;Type = "Swords (G.)";ShortName = "Magic sword"}
[pscustomobject]@{Min = 87;Max = 100;Type = "Miscellaneous Weapons (H.)";ShortName = "Magic weapon"}

)
#The above is found in the Advanced Dungeons and Dragons' Dungeon Masters Guide's Table 3 (pg. 121). The below are subtables on its following pages, (to pg. 125) related to the above.

function Get-MagicItemTypeRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $Result = $MagicItemType | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    $Result

}

$PotionsTable = @(

[pscustomobject]@{Min = 1;Max = 3;Item = "Potion of Animal Control";XP = 250;Value = 400}
[pscustomobject]@{Min = 4;Max = 6;Item = "Potion of Clairaudience";XP = 250;Value = 400}
[pscustomobject]@{Min = 7;Max = 9;Item = "Potion of Clairvoyance";XP = 300;Value = 500}
[pscustomobject]@{Min = 10;Max = 12;Item = "Potion of Climbing";XP = 300;Value = 500}
[pscustomobject]@{Min = 13;Max = 15;Item = "Potion of Delusion";XP = 0;Value = 150}
[pscustomobject]@{Min = 16;Max = 18;Item = "Potion of Diminution";XP = 300;Value = 500}
[pscustomobject]@{Min = 19;Max = 20;Item = "Potion of Dragon Control";XP = "500 - 1000";Value = "5000 - 9000"}
[pscustomobject]@{Min = 21;Max = 23;Item = "Potion of ESP";XP = 500;Value = 850}
[pscustomobject]@{Min = 24;Max = 26;Item = "Potion of Extra-Healing";XP = 400;Value = 800}
[pscustomobject]@{Min = 27;Max = 29;Item = "Potion of Fire Resistance";XP = 250;Value = 400}
[pscustomobject]@{Min = 30;Max = 32;Item = "Potion of Flying";XP = 500;Value = 750}
[pscustomobject]@{Min = 33;Max = 34;Item = "Potion of Gaseous Form";XP = 300;Value = 400}
[pscustomobject]@{Min = 35;Max = 36;Item = "Potion of Giant Control";XP = "400 - 900";Value = "1000 - 6000"}
[pscustomobject]@{Min = 37;Max = 39;Item = "Potion of Giant Strength";XP = "500 - 750";Value = "900 - 1400"}
[pscustomobject]@{Min = 40;Max = 41;Item = "Potion of Growth";XP = 250;Value = 300}
[pscustomobject]@{Min = 42;Max = 47;Item = "Potion of Healing";XP = 200;Value = 400}
[pscustomobject]@{Min = 48;Max = 49;Item = "Potion of Heroism";XP = 300;Value = 500}
[pscustomobject]@{Min = 50;Max = 51;Item = "Potion of Human Control";XP = 500;Value = 900}
[pscustomobject]@{Min = 52;Max = 54;Item = "Potion of Invisibility";XP = 250;Value = 500}
[pscustomobject]@{Min = 55;Max = 57;Item = "Potion of Invulnerability";XP = 350;Value = 500}
[pscustomobject]@{Min = 58;Max = 60;Item = "Potion of Levitation";XP = 250;Value = 400}
[pscustomobject]@{Min = 61;Max = 63;Item = "Potion of Longevity";XP = 500;Value = 1000}
[pscustomobject]@{Min = 64;Max = 66;Item = "Oil of Etherealness";XP = 600;Value = 1500}
[pscustomobject]@{Min = 67;Max = 69;Item = "Oil of Slipperiness";XP = 400;Value = 750}
[pscustomobject]@{Min = 70;Max = 72;Item = "Philter of Love";XP = 200;Value = 300}
[pscustomobject]@{Min = 73;Max = 75;Item = "Philter of Persuasiveness";XP = 400;Value = 850}
[pscustomobject]@{Min = 76;Max = 78;Item = "Potion of Plant Control";XP = 250;Value = 300}
[pscustomobject]@{Min = 79;Max = 81;Item = "Potion of Polymorph (self)";XP = 200;Value = 350}
[pscustomobject]@{Min = 82;Max = 84;Item = "Potion of Poison";XP = 0;Value = 0}
[pscustomobject]@{Min = 85;Max = 87;Item = "Potion of Speed";XP = 200;Value = 450}
[pscustomobject]@{Min = 88;Max = 90;Item = "Potion of Super-Heroism";XP = 450;Value = 750}
[pscustomobject]@{Min = 91;Max = 93;Item = "Potion of Sweet Water";XP = 200;Value = 250}
[pscustomobject]@{Min = 94;Max = 96;Item = "Potion of Treasure Finding";XP = 600;Value = 2000}
[pscustomobject]@{Min = 97;Max = 97;Item = "Potion of Undead Control";XP = 700;Value = 2500}
[pscustomobject]@{Min = 98;Max = 100;Item = "Potion of Water Breathing";XP = 400;Value = 900}

)

function Get-PotionsTableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $Result = $PotionsTable | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    $Result

}

$ScrollsTable = @(

[pscustomobject]@{Min = 1;Max = 10;Item = "1 scroll";SpellLevelRange = "1-4";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 11;Max = 16;Item = "1 scroll";SpellLevelRange = "1-6";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 17;Max = 19;Item = "1 scroll";SpellLevelRange = "2-9 or 2-7*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 20;Max = 24;Item = "2 scrolls";SpellLevelRange = "1-4";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 25;Max = 27;Item = "2 scrolls";SpellLevelRange = "1-8 or 1-6*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 28;Max = 32;Item = "3 scrolls";SpellLevelRange = "1-4";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 33;Max = 35;Item = "3 scrolls";SpellLevelRange = "2-9 or 2-7*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 36;Max = 39;Item = "4 scrolls";SpellLevelRange = "1-6";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 40;Max = 42;Item = "4 scrolls";SpellLevelRange = "1-8 or 1-6*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 43;Max = 46;Item = "5 scrolls";SpellLevelRange = "1-6";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 47;Max = 49;Item = "5 scrolls";SpellLevelRange = "1-8 or 1-6*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 50;Max = 52;Item = "6 scrolls";SpellLevelRange = "1-6";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 53;Max = 54;Item = "6 scrolls";SpellLevelRange = "3-8 or 3-6*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 55;Max = 57;Item = "7 scrolls";SpellLevelRange = "1-8";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 58;Max = 59;Item = "7 scrolls";SpellLevelRange = "2-9";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 60;Max = 60;Item = "7 scrolls";SpellLevelRange = "4-9 or 4-7*";XPValue = "100 * spell level";Value = "XP value * 3"}
[pscustomobject]@{Min = 61;Max = 62;Item = "1 scroll (Protection - Demons)";SpellLevelRange = "";XPValue = "2500";Value = "12500"}
[pscustomobject]@{Min = 63;Max = 64;Item = "1 scroll (Protection - Devils)";SpellLevelRange = "";XPValue = "2500";Value = "12500"}
[pscustomobject]@{Min = 65;Max = 70;Item = "1 scroll (Protection - Elementals)";SpellLevelRange = "";XPValue = "1500";Value = "7500"}
[pscustomobject]@{Min = 71;Max = 76;Item = "1 scroll (Protection - Lycanthropes)";SpellLevelRange = "";XPValue = "1000";Value = "5000"}
[pscustomobject]@{Min = 77;Max = 82;Item = "1 scroll (Protection - Magic)";SpellLevelRange = "";XPValue = "1500";Value = "7500"}
[pscustomobject]@{Min = 83;Max = 87;Item = "1 scroll (Protection - Petrification)";SpellLevelRange = "";XPValue = "2000";Value = "10000"}
[pscustomobject]@{Min = 88;Max = 92;Item = "1 scroll (Protection - Possession)";SpellLevelRange = "";XPValue = "2000";Value = "10000"}
[pscustomobject]@{Min = 93;Max = 97;Item = "1 scroll (Protection - Undead)";SpellLevelRange = "";XPValue = "1500";Value = "7500"}
[pscustomobject]@{Min = 98;Max = 100;Item = "1 cursed scroll";SpellLevelRange = "";XPValue = "0";Value = "0"}

)
#*30% of all scrolls are of clerical nature (dice 71-00), and 25% of all clerical scrolls are druidical. 10% of all magic-user scrolls are illusionist. This applies only to scrolls 01-60 above. Asterisked numbers indicate clerical spell levels.

function Get-ScrollsTableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $Result = $ScrollsTable | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    $Result

}

#To do: tables 3C - 3H

#endregion

#region Monster tables

$DungeonRandomMonsterLevel1Table = @(

[pscustomobject]@{Min = 1;Max = 2;Monster="Giant ant";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 3;Max = 4;Monster="Badger";Number="1-4";Lowest=2;Base=0;VarianceDie = 4;VarianceDiceNumber = 1;Else=[pscustomobject]@{Monster="Hobgoblin";Number="2-8";Base=2;VarianceDie = 6;VarianceDiceNumber = 3}}
[pscustomobject]@{Min = 5;Max = 14;Monster="Fire beetle";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 15;Max = 15;Monster="Manes";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 16;Max = 17;Monster="Dwarf";Number="4-14";Lowest=100;Base=2;VarianceDie = 6;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 18;Max = 18;Monster="Ear seeker";Number="1";Lowest=100;Base=1;VarianceDie = 0;VarianceDiceNumber = 0}
[pscustomobject]@{Min = 19;Max = 19;Monster="Elf";Number="3-11";Lowest=100;Base=1;VarianceDie = 4,6;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 20;Max = 21;Monster="Gnome";Number="5-15";Lowest=100;Base=4;VarianceDie = 10;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 22;Max = 26;Monster="Goblin";Number="6-15";Lowest=100;Base=5;VarianceDie = 10;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 27;Max = 28;Monster="Halfling";Number="9-16";Lowest=4;Base=8;VarianceDie = 8;VarianceDiceNumber = 1;Else=[pscustomobject]@{Monster="Giant rat";Number="5-20"}}
[pscustomobject]@{Min = 29;Max = 33;Monster="Hobgoblin";Number="2-8";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 34;Max = 48;Monster="Human";Number="?";Lowest=100}
[pscustomobject]@{Min = 49;Max = 54;Monster="Kobold";Number="6-18";Lowest=100;Base=2;VarianceDie = 4;VarianceDiceNumber = 4}
[pscustomobject]@{Min = 55;Max = 66;Monster="Orc";Number="7-12";Lowest=100;Base=6;VarianceDie = 6;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 67;Max = 70;Monster="Piercer";Number="1-3";Lowest=100;Base=1;VarianceDie = 2;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 71;Max = 83;Monster="Giant rat";Number="5-20";Lowest=100;Base=2;VarianceDie = 6;VarianceDiceNumber = 3}
[pscustomobject]@{Min = 84;Max = 85;Monster="Rot grub";Number="1-3";Lowest=100;Base=1;VarianceDie = 2;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 86;Max = 96;Monster="Shrieker";Number="1-2";Lowest=100;Base=0;VarianceDie = 2;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 97;Max = 98;Monster="Skeleton";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 99;Max = 100;Monster="Zombie";Number="1-3";Lowest=100;Base=1;VarianceDie = 2;VarianceDiceNumber = 1}

)
#The above is derrived from the Advanced Dungeons and Dragons' Dungeon Masters Guide's Appendix C pg. 175

function Get-DungeonRandomMonsterLevel1Roll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [int]$Level
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    if(($Level -like $Null) -or (!$Level)){$Level = 1}

    $DungeonRandomMonsterLevel1TableResult = $DungeonRandomMonsterLevel1Table | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    if($DungeonRandomMonsterLevel1TableResult.Lowest -lt $Level){$Relevant = $DungeonRandomMonsterLevel1TableResult.Else}else{$Relevant = $DungeonRandomMonsterLevel1TableResult}

    $NumberAppearing = $Relevant.Number

    if($Relevant.Monster -ne "Human"){

        if(($Roll -ne 19) -and ($Roll -ne 18)){$NumberAppearing = $Relevant.Base + ((Get-Random -Minimum 1 -Maximum ($Relevant.VarianceDie + 1)) * $Relevant.VarianceDiceNumber)}
        if($Roll -eq 18){$NumberAppearing = 1}
        if($Roll -eq 19){$NumberAppearing = (Get-D6Roll).Result + (Get-D4Roll).Result + 1}

    }

    [pscustomobject]@{
    
        Roll = $Roll
        Encounter = $Relevant.Monster
        NumberAppearing = $NumberAppearing

    }

}

$HumanSubtable = @(

[pscustomobject]@{Min = 1;Max = 25;Human ="Bandit";Number = "5-15";Base=3;VarianceDie = 6;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 26;Max = 30;Human ="Berserker";Number = "3-9";Base=1;VarianceDie = 4;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 31;Max = 45;Human ="Brigand";Number = "3-9";Base=1;VarianceDie = 4;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 46;Max = 100;Human ="NPC party";Number = "?"}

)

function Get-HumanSubtableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $HumanSubtableResult = $HumanSubtable | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    $NumberAppearing = $HumanSubtableResult.Number

    if($HumanSubtableResult.Human -notlike "*NPC*"){$NumberAppearing = $HumanSubtableResult.Base + ((Get-Random -Minimum 1 -Maximum ($HumanSubtableResult.VarianceDie + 1)) * $HumanSubtableResult.VarianceDiceNumber)}

    [pscustomobject]@{
    
        Roll = $Roll
        Encounter = $HumanSubtableResult.Human
        NumberAppearing = $NumberAppearing

    }

}

$CharacterSubtable = @(

[pscustomobject]@{Min = 1;Max = 17;Monster="Cleric";MaximumNumberPerParty=3}
[pscustomobject]@{Min = 18;Max = 20;Monster="Druid";MaximumNumberPerParty=2}
[pscustomobject]@{Min = 21;Max = 60;Monster="Fighter";MaximumNumberPerParty=5}
[pscustomobject]@{Min = 61;Max = 62;Monster="Paladin";MaximumNumberPerParty=2}
[pscustomobject]@{Min = 63;Max = 65;Monster="Ranger";MaximumNumberPerParty=2}
[pscustomobject]@{Min = 66;Max = 86;Monster="Magic-user";MaximumNumberPerParty=3}
[pscustomobject]@{Min = 87;Max = 88;Monster="Illusionist";MaximumNumberPerParty=1}
[pscustomobject]@{Min = 89;Max = 98;Monster="Thief";MaximumNumberPerParty=4}
[pscustomobject]@{Min = 99;Max = 99;Monster="Assassin";MaximumNumberPerParty=2}
[pscustomobject]@{Min = 100;Max = 100;Monster="Monk or Bard";MaximumNumberPerParty=1}

)
#Number Of Characters In Party: There will always be 2-5 characters in a character group, with men-at-arms or henchmen to round the party out to 9. Roll d4, and add 1 to the result in order to find the number of characters, then dice on the Character Subtable to find the profession of each, ignoring rolls which are contradictory (a paladin and an assassin, for instance) or exceed the maximum number of a character class possible in any given party. The number of characters subtracted from 9 gives the number of men-at-arms or henchmen accompanying the characters.
#Level Of Characters: The level of each character will be equal to that of the level of the dungeon or the level of monster, whichever is greater, through the 4th level. Thereafter it will be between 7th and 12th, determined by a roll of d6 +6, and adjusted as follows: If the total is higher than the level of the dungeon, reduce it by -1. If it is lower than the level of the dungeon, adjust it upwards by +1, but do not exceed 12 levels unless the dungeon level is 16th or deeper.

function Get-CharacterSubtableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [bool]$NoPaladin,
        [Parameter(Mandatory=$False)]
        [bool]$NoAssassin,
        [Parameter(Mandatory=$False)]
        [bool]$NoCleric,
        [Parameter(Mandatory=$False)]
        [bool]$NoDruid,
        [Parameter(Mandatory=$False)]
        [bool]$NoFighter,
        [Parameter(Mandatory=$False)]
        [bool]$NoRanger,
        [Parameter(Mandatory=$False)]
        [bool]$NoMagicUser,
        [Parameter(Mandatory=$False)]
        [bool]$NoIllusionist,
        [Parameter(Mandatory=$False)]
        [bool]$NoThief,
        [Parameter(Mandatory=$False)]
        [bool]$NoMonk,
        [Parameter(Mandatory=$False)]
        [bool]$NoBard
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $ForbiddenNumbers = @()

    if($NoCleric){1..17 | %{$ForbiddenNumbers += $_}}
    if($NoDruid){18..20 | %{$ForbiddenNumbers += $_}}
    if($NoFighter){21..60 | %{$ForbiddenNumbers += $_}}
    if($NoPaladin){61..62 | %{$ForbiddenNumbers += $_}}
    if($NoRanger){63..65 | %{$ForbiddenNumbers += $_}}
    if($NoMagicUser){66..86 | %{$ForbiddenNumbers += $_}}
    if($NoIllusionist){87..88 | %{$ForbiddenNumbers += $_}}
    if($NoThief){89..98 | %{$ForbiddenNumbers += $_}}
    if($NoAssassin){99 | %{$ForbiddenNumbers += $_}}
    if(($NoMonk) -or ($NoBard)){100 | %{$ForbiddenNumbers += $_}}

    while($ForbiddenNumbers -contains $Roll){
    
        $Roll = (Get-D100Roll).Result

    }

    $CharacterSubtableResult = $CharacterSubtable | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    $Character = $CharacterSubtableResult.Monster

    if($Character -like "Monk or Bard"){if((Get-D2Roll).Result -eq 1){$Character = "Monk"}else{$Character = "Bard"}}

    [pscustomobject]@{
    
        Roll = $Roll
        NPC = $Character
        MaximumNumberPerParty = $CharacterSubtableResult.MaximumNumberPerParty

    }

}

$NPCRaceAndMultiClassTable = @(

[pscustomobject]@{Min = 1;Max = 25;Race="Dwarf";MultiClassLikelihood=15}
[pscustomobject]@{Min = 26;Max = 50;Race="Elf";MultiClassLikelihood=85}
[pscustomobject]@{Min = 51;Max = 60;Race="Gnome";MultiClassLikelihood=25}
[pscustomobject]@{Min = 61;Max = 85;Race="Half-elf";MultiClassLikelihood=85}
[pscustomobject]@{Min = 86;Max = 95;Race="Halfling";MultiClassLikelihood=10}
[pscustomobject]@{Min = 96;Max = 100;Race="Half-Orc";MultiClassLikelihood=50}

)

function Get-NPCRaceAndMultiClassTableRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}
    $BoolMultiClass = $False

    $NPCRaceAndMultiClassTableResult = $NPCRaceAndMultiClassTable | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    if((Get-D100Roll).Result -le $NPCRaceAndMultiClassTableResult.MultiClassLikelihood){$BoolMultiClass = $True}

    [pscustomobject]@{
    
        Roll = $Roll
        NPCRace = $NPCRaceAndMultiClassTableResult.Race
        NPCMultiClassLikelihood = $NPCRaceAndMultiClassTableResult.MultiClassLikelihood
        BoolMultiClass = $BoolMultiClass

    }

}
#The rules do note that it is permissible to use race/profession (class) combinations that are normally "very limited or impossible", (pg. 176) though this is in the context of the NPC having a Multi-Class.
#I am opting not to include rules regarding multiclassing at this time. Maybe later I will revisit this.

function Get-NPCPartyRoll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [int]$Level,
        [Parameter(Mandatory=$False)]
        [int]$MonsterLevel
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    if(($Level -like $Null) -or (!$Level)){$Level = 1}

    #DMG pg. 175:
    if($Level -le 4){if($Level -ge $MonsterLevel){$LevelOfCharacters = $Level}else{$LevelOfCharacters = $MonsterLevel}}
    if($Level -gt 4){$LevelOfCharacters = ((Get-D6Roll).Result) + 6;if($LevelOfCharacters -gt $Level){$LevelOfCharacters--}elseif($LevelOfCharacters -lt $Level){$LevelOfCharacters++}}
    if(($LevelOfCharacters -gt 12) -and ($Level -le 15)){$LevelOfCharacters = 12}

    $NumberInParty = 1 + (Get-D4Roll).Result

    $ClericBan = $False
    $DruidBan = $False
    $FighterBan = $False
    $PaladinBan = $False
    $RangerBan = $False
    $MagicUserBan = $False
    $IllusionistBan = $False
    $ThiefBan = $False
    $AssassinBan = $False
    $MonkBan = $False
    $BardBan = $False
    $Race = ''

    $NPCParty = @()

    1..$NumberInParty | %{

        if(($NPCParty.NPC | ?{$_ -like "Cleric"} | Measure).Count -ge 3){$ClericBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Druid"} | Measure).Count -ge 2){$DruidBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Fighter"} | Measure).Count -ge 5){$FighterBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Paladin"} | Measure).Count -ge 2){$PaladinBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Ranger"} | Measure).Count -ge 2){$RangerBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Magic-user"} | Measure).Count -ge 3){$MagicUserBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Illusionist"} | Measure).Count -ge 1){$IllusionistBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Thief"} | Measure).Count -ge 4){$ThiefBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Assassin"} | Measure).Count -ge 2){$AssassinBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Monk"} | Measure).Count -ge 1){$MonkBan = $True}
        if(($NPCParty.NPC | ?{$_ -like "Bard"} | Measure).Count -ge 1){$BardBan = $True}

        if(($NPCParty.NPC | ?{$_ -like "Paladin"} | Measure).Count -gt 0){
        
            $AssassinBan = $True
            
        }elseif(($NPCParty.NPC | ?{$_ -like "Assassin"} | Measure).Count -gt 0){
        
            $PaladinBan = $True
            
        }

        #DMG pg. 176:
        if((Get-D100Roll).Result -le 20){$Race = (Get-NPCRaceAndMultiClassTableRoll).NPCRace}else{$Race = "Human"}
        
        $PotentialPartyMember = Get-CharacterSubtableRoll -NoCleric $ClericBan -NoDruid $DruidBan -NoFighter $FighterBan -NoPaladin $PaladinBan -NoRanger $RangerBan -NoMagicUser $MagicUserBan -NoIllusionist $IllusionistBan -NoThief $ThiefBan -NoAssassin $AssassinBan -NoMonk $MonkBan -NoBard $BardBan
            
        $NPCParty += "$($Race) $($PotentialPartyMember.NPC.ToLower())"
            
    }

    $NPCPartyOutput = $NPCParty
    #DMG pg. 175:
    if($Level -le 3){$NPCPartyOutput += "Henchmen x $((9 - $NumberInParty))"}else{$NPCPartyOutput += "Men-at-arms x $((9 - $NumberInParty))"}

    [pscustomobject]@{
        
        NPCPartyOutput = $NPCPartyOutput
        LevelOfCharacters = $LevelOfCharacters

    }

}

$DungeonRandomMonsterLevel2Table = @(

[pscustomobject]@{Min = 1;Max = 1;Monster="Giant badger";Number="1-4";Lowest=3;Base=0;VarianceDie = 4;VarianceDiceNumber = 1;Else=[pscustomobject]@{Monster="Gnoll";Number="4-10";Lowest=100;Base=2;VarianceDie = 4;VarianceDiceNumber = 2}}
[pscustomobject]@{Min = 2;Max = 16;Monster="Giant centipede";Number="3-13";Lowest=100;Base=1;VarianceDie = 6;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 17;Max = 27;Monster="NPC Party";Number="?";Lowest=100}
[pscustomobject]@{Min = 28;Max = 29;Monster="Lemure";Number="2-5";Lowest=100;Base=1;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 30;Max = 31;Monster="Gas spore";Number="1-2";Lowest=100;Base=0;VarianceDie = 2;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 32;Max = 38;Monster="Gnoll";Number="4-10";Lowest=100;Base=2;VarianceDie = 4;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 39;Max = 46;Monster="Piercer";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 47;Max = 58;Monster="Giant rat";Number="6-24";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 6}
[pscustomobject]@{Min = 59;Max = 60;Monster="Rot grub";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 61;Max = 72;Monster="Shrieker";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 73;Max = 77;Monster="Stirge";Number="5-15";Lowest=100;Base=3;VarianceDie = 6;VarianceDiceNumber = 2}
[pscustomobject]@{Min = 78;Max = 87;Monster="Giant toad";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 88;Max = 100;Monster="Troglodyte";Number="2-8";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 2}

)

function Get-DungeonRandomMonsterLevel2Roll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [int]$Level
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    if(($Level -like $Null) -or (!$Level)){$Level = 1}

    $DungeonRandomMonsterLevel2TableResult = $DungeonRandomMonsterLevel2Table | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    if($DungeonRandomMonsterLevel2TableResult.Lowest -lt $Level){$Relevant = $DungeonRandomMonsterLevel2TableResult.Else}else{$Relevant = $DungeonRandomMonsterLevel2TableResult}

    $NumberAppearing = $Relevant.Number

    if($Relevant.Monster -ne "NPC Party"){

        $NumberAppearing = $Relevant.Base + ((Get-Random -Minimum 1 -Maximum ($Relevant.VarianceDie + 1)) * $Relevant.VarianceDiceNumber)
        

    }

    [pscustomobject]@{
    
        Roll = $Roll
        Encounter = $Relevant.Monster
        NumberAppearing = $NumberAppearing

    }

}

$DungeonRandomMonsterLevel3Table = @(

[pscustomobject]@{Min = 1;Max = 10;Monster="Boring beetle";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 11;Max = 20;Monster="Bugbear";Number="2-7";Lowest=100;Base=1;VarianceDie = 6;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 21;Max = 30;Monster="NPC Party";Number="?";Lowest=100}
[pscustomobject]@{Min = 31;Max = 32;Monster="Dragon";Number="1";Lowest=100;Base=1;VarianceDie = 0;VarianceDiceNumber = 0}
[pscustomobject]@{Min = 33;Max = 34;Monster="Violet fungi";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 35;Max = 40;Monster="Gelatinous cube";Number="1";Lowest=100;Base=1;VarianceDie = 0;VarianceDiceNumber = 0}
[pscustomobject]@{Min = 41;Max = 45;Monster="Ghoul";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 46;Max = 50;Monster="Giant lizard";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 51;Max = 54;Monster="Wererat";Number="2-5";Lowest=100;Base=1;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 55;Max = 60;Monster="Ochre jelly";Number="1";Lowest=100;Base=1;VarianceDie = 0;VarianceDiceNumber = 0}
[pscustomobject]@{Min = 61;Max = 72;Monster="Ogre";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 73;Max = 74;Monster="Piercer";Number="2-5";Lowest=100;Base=1;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 75;Max = 75;Monster="Rot grub";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 76;Max = 77;Monster="Shrieker";Number="2-5";Lowest=100;Base=1;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 78;Max = 84;Monster="Huge spider";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 85;Max = 93;Monster="Large spider";Number="2-5";Lowest=100;Base=1;VarianceDie = 4;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 94;Max = 95;Monster="Giant tick";Number="1-3";Lowest=100;Base=0;VarianceDie = 3;VarianceDiceNumber = 1}
[pscustomobject]@{Min = 96;Max = 100;Monster="Giant weasel";Number="1-4";Lowest=100;Base=0;VarianceDie = 4;VarianceDiceNumber = 1}

)

function Get-DungeonRandomMonsterLevel3Roll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        [int]$Level
   
    )

    if($Roll -gt 100){$Roll = 100}
    if(!$Roll){$Roll = (Get-D100Roll).Result}

    if(($Level -like $Null) -or (!$Level)){$Level = 1}

    $DungeonRandomMonsterLevel3TableResult = $DungeonRandomMonsterLevel3Table | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    if($DungeonRandomMonsterLevel3TableResult.Lowest -lt $Level){$Relevant = $DungeonRandomMonsterLevel3TableResult.Else}else{$Relevant = $DungeonRandomMonsterLevel3TableResult}

    $NumberAppearing = $Relevant.Number

    if($Relevant.Monster -ne "NPC Party"){

        if($Relevant.Number -eq "1"){$NumberAppearing = 1}else{$NumberAppearing = $Relevant.Base + ((Get-Random -Minimum 1 -Maximum ($Relevant.VarianceDie + 1)) * $Relevant.VarianceDiceNumber)}

    }

    if($Relevant.Monster -like "Dragon"){$Relevant.Monster = "$((Get-DragonLevel3Roll).Description) dragon"}

    [pscustomobject]@{
    
        Roll = $Roll
        Encounter = $Relevant.Monster
        NumberAppearing = $NumberAppearing

    }

}

$DragonLevel3Subtable = @(

[pscustomobject]@{Min = 1;Max = 28;DragonType="Black";AgeCategory="Very young";HitDice=1}
[pscustomobject]@{Min = 29;Max = 62;DragonType="Brass";AgeCategory="Very young";HitDice=1}
[pscustomobject]@{Min = 63;Max = 100;DragonType="White";AgeCategory="Very young";HitDice=1}

)

function Get-DragonLevel3Roll {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Roll
   
    )

    if(!$Roll){$Roll = (Get-D100Roll).Result}

    $DragonLevel3SubtableResult = $DragonLevel3Subtable | ?{$_.Min -le $Roll} | ?{$_.Max -ge $Roll}

    [pscustomobject]@{
    
        Roll = $Roll
        Color = $DragonLevel3SubtableResult.DragonType
        Age = $DragonLevel3SubtableResult.AgeCategory
        Description = "$($DragonLevel3SubtableResult.AgeCategory) $($DragonLevel3SubtableResult.DragonType.ToLower())"
        HitDice = $DragonLevel3SubtableResult.HitDice

    }

}


#To do: Tables for moster level 4 and above

#endregion

###################################
#The following are tools that I have created designed to more quickly flesh out a random dungeon based on the above

function Get-5BSpecialArea {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Rerolls

    )

    if(!$Rerolls){$Rerolls = 1}

    2000 * $Rerolls

}

function Get-SpecificNumberOfExits {

     param(

        [Parameter(Mandatory=$False)]
        [int]$Roll,
        [Parameter(Mandatory=$False)]
        $Type,
        [Parameter(Mandatory=$False)]
        [int]$Width,
        [Parameter(Mandatory=$False)]
        [int]$Length,
        [Parameter(Mandatory=$False)]
        [int]$Area

    )

    $Passage = $False
    $SecretDoors = 0
    if($Length -and $Width){$Area = $Length * $Width}
    if(!$Roll){$5CRoll = Get-NumberOfExits -RoomArea $Area}else{$5CRoll = Get-NumberOfExits -Roll $Roll -RoomArea $Area}

    if($5CRoll.Roll -le 15){$ExitsNumber = $5CRoll.Description}
    if(($5CRoll.Roll -eq 16) -or ($5CRoll.Roll -eq 17) -or ($5CRoll.Roll -eq 18)){$ExitsNumber = (Get-D4Roll).Result}
    if($5CRoll.Description -like "0*"){$ExitsNumber = 0;1..((($Width * 2) + ($Length * 2)) / 10) | %{if((Get-D20Roll).Result -le 5){$SecretDoors++}}}
    if(($5CRoll.Roll -eq 19) -or ($5CRoll.Roll -eq 20)){
   
        if($Type -eq "Chamber"){$ExitsNumber = 1;$Passage = $True}
        if($Type -eq "Room"){$ExitsNumber = 1;$Passage = $True}

    }

    <#

    if($Type -eq "Unusual"){
   
        $ExitsNumber = "?"
        $SecretDoors = "?"

    }

    #>

    [pscustomobject]@{
   
        Exits = $ExitsNumber
        SecretDoors = $SecretDoors
        Passage = $Passage

    }

}

function Get-Monster {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Level

    )

    $Party = ""
    $MonsterLevel = ""

    $DungeonLevelRoll = (Get-D20Roll).Result

    #region Dungeon level 1
    if(($Level -eq 1) -and ($DungeonLevelRoll -le 16)){$MonsterLevel = 1;$MonsterRoll = Get-DungeonRandomMonsterLevel1Roll -Level $Level}
    if(($Level -eq 1) -and ($DungeonLevelRoll -ge 17) -and ($DungeonLevelRoll -le 19)){$MonsterLevel = 2;$MonsterRoll = Get-DungeonRandomMonsterLevel2Roll -Level $Level}
    if(($Level -eq 1) -and ($DungeonLevelRoll -eq 20)){$MonsterLevel = 3;$MonsterRoll = Get-DungeonRandomMonsterLevel3Roll -Level $Level}
    #endregion

    if($MonsterRoll.Encounter -like "Human"){$MonsterRoll = Get-HumanSubtableRoll}

    if($MonsterRoll.Encounter -notlike "NPC Party"){$SimpleEncounter = "$($MonsterRoll.Encounter) x $($MonsterRoll.NumberAppearing)"}else{$SimpleEncounter = $MonsterRoll.Encounter}

    if($MonsterRoll.Encounter -like "NPC Party"){
    
        $MonsterRoll = Get-NPCPartyRoll -Level $Level -MonsterLevel $MonsterLevel
        
        foreach($NPC in ($MonsterRoll.NPCPartyOutput | sort | Get-Unique)){
        
            if(($NPC -notlike "Henchmen*") -and ($NPC -notlike "Men-at*")){
            
                $Party = "$($Party)$($NPC)$(if(($MonsterRoll | ?{$_ -like $NPC} | Measure).Count -gt 1){' x '})$(if(($MonsterRoll | ?{$_ -like $NPC} | Measure).Count -gt 1){($MonsterRoll | ?{$_ -like $NPC} | Measure).Count}), "
                
            }else{
            
                $Party = "$($Party)$($NPC), "
                
            }

        }
            
            $Party = $Party.Trim()
            if($Party -like "*,"){$Party = "$($Party.Substring(0,($Party.Length - 1)))"}

    }

    [pscustomobject]@{

        MonsterLevel = if($Party -ne ""){$MonsterRoll.LevelOfCharacters}else{$MonsterLevel}
        Encounter = if($Party -ne ""){"NPC party ($($Party))"}else{$SimpleEncounter}
        #RawPartyInfo = if($SimpleEncounter -like "NPC party"){$MonsterRoll}else{"N/A"}

    }

}

function Get-Treasure {

    param(

        [Parameter(Mandatory=$False)]
        [int]$Table5GRoll,
        [Parameter(Mandatory=$False)]
        [int]$Level,
        [Parameter(Mandatory=$False)]
        [int]$RollBonus

    )

    if((!$Level) -or ($Level -eq $Null)){$Level = 1}

    if(!$Table5GRoll){$Table5GRoll = (Get-D100Roll).Result}

    if($RollBonus){$Table5GRoll = $Table5GRoll + $RollBonus}

    if($Table5GRoll -gt 100){$Table5GRoll = 100}

    $Treasure = Get-Table5GRoll -Roll $Table5GRoll -Monster $False -Level $Level

    $DetailedLoot = @()
    $Loot = @()

    if($Treasure.Roll -le 90){
    
        $Loot += [pscustomobject]@{
        
            Item = $Treasure.Loot.Type
            Amount = $Treasure.Loot.Amount
            Value = $Treasure.Loot.Value

        }

        $DetailedLoot += $Treasure.Loot

    }elseif(($Treasure.Roll -ge 91) -and ($Treasure.Roll -le 94)){
    
        1..((Get-D4Roll).Result * $Level) | %{$Gem = Get-Gem;$Loot += [pscustomobject]@{
        
                Item = $Gem.Item
                Amount = 1
                Value = if($Gem.ModifiedValue -notlike '-'){$Gem.ModifiedValue}else{$Gem.BaseValue}}

                $DetailedLoot += $Gem
            
            }

    }elseif(($Treasure.Roll -ge 95) -and ($Treasure.Roll -le 97)){
    
        1..(1 * $Level) | %{$JewelryLoot = Get-Jewelry
        
            $Loot += [pscustomobject]@{
        
                    Item = $JewelryLoot.Item
                    Amount = 1
                    Value = $JewelryLoot.Value
                
                }

                $DetailedLoot += $JewelryLoot
                
            }

    }elseif($Treasure.Roll -ge 98){
        
        $MagicItem = Get-MagicItemTypeRoll

        $Loot += [pscustomobject]@{
        
            Item = $MagicItem.ShortName
            Amount = 1
            Value = "Varies"

        }

        $DetailedLoot += $MagicItem
                
    }

    [pscustomobject]@{

        Loot = $Loot
        DetailedLoot = $DetailedLoot

    }

}

function Get-Gem {

    param(

        [Parameter(Mandatory=$False)]
        [int]$GemTableRoll,

        [Parameter(Mandatory=$False)]
        [int]$GemModifierRoll
   
    )

    $BonusValue = $Null
    $NewValue = $Null
    $ModifierRolls = @()

    if(!$GemTableRoll){$GemTableRoll = (Get-D100Roll).Result}
    if(!$GemModifierRoll){$GemModifierRoll = (Get-D10Roll).Result}
    $ModifierRolls += $GemModifierRoll

    $GemTable = Get-GemTableRoll -Roll $GemTableRoll

    $TypeOfGemTable = switch($GemTable.Result.Class){
    
        1 {Get-OrnamentalStone}
        2 {Get-SemiPreciousStone}
        3 {Get-FancyStone}
        4 {Get-FancyPreciousStone}
        5 {Get-GemStone}
        6 {Get-Jewel}

    }

    $GemModifier = Get-GemModifierRoll -Roll $GemModifierRoll

    if($GemModifier.Roll -eq 1){

        $i = 0

        while(($GemModifier.Roll -eq 1) -and ($i -le 7)){
               
            $i++
            $GemModifier = Get-GemModifierRoll -Roll (Get-Random -Minimum 1 -Maximum 8)
            $ModifierRolls += ($GemModifier).Roll
            
        }

        $Explode = 0
        if(($GemTable.Result.Class + $i) -gt 6){$Explode = $i - 6}

        if($GemTable.Result.Class -le 6){
        
            $TypeOfGemTable = switch($GemTable.Result.Class + $i){
    
                1 {Get-OrnamentalStone}
                2 {Get-SemiPreciousStone}
                3 {Get-FancyStone}
                4 {Get-FancyPreciousStone}
                5 {Get-GemStone}
                6 {Get-Jewel}

            }

        }else{
        
            $TypeOfGemTable = Get-Jewel

        }

        if($Explode -gt 0){
            
            $NewValue = switch($Explode){
            
                1 {10000}
                2 {25000}
                3 {50000}
                4 {100000}
                5 {250000}
                6 {500000}
                7 {1000000}

            }

        }

    }elseif($GemModifier.Roll -eq 2){
    
        $NewValue = $TypeOfGemTable.Result.Value * 2

    }elseif($GemModifier.Roll -eq 3){
    
        $BonusValue = ((Get-D6Roll).Result * .1) + 1
        if($NewValue -eq $Null){$NewValue = $TypeOfGemTable.Result.Value * $BonusValue}else{$NewValue = $NewValue * $BonusValue}

    }elseif($GemModifier.Roll -eq 9){

        $BonusValue = 1 - ((Get-D4Roll).Result * .1)
        if($NewValue -eq $Null){$NewValue = $TypeOfGemTable.Result.Value * $BonusValue}else{$NewValue = $NewValue * $BonusValue}

    }elseif($GemModifier.Roll -eq 10){

        $i = 0

        while(($GemModifier.Roll -eq 10) -and ($i -le 5)){
               
            $i++
            $GemModifier = Get-GemModifierRoll -Roll (Get-Random -Minimum 3 -Maximum 11)
            $ModifierRolls += ($GemModifier).Roll
            
        }

        $Explode = 0
        if(($GemTable.Result.Class - $i) -lt 1){$Explode = $i}

        if(($GemTable.Result.Class - $i) -ge 1){
        
            $TypeOfGemTable = switch($GemTable.Result.Class - $i){
    
                1 {Get-OrnamentalStone}
                2 {Get-SemiPreciousStone}
                3 {Get-FancyStone}
                4 {Get-FancyPreciousStone}
                5 {Get-GemStone}
                6 {Get-Jewel}

            }

        }else{
        
            $TypeOfGemTable = Get-OrnamentalStone

        }

        if($Explode -gt 0){
            
            $NewValue = switch($Explode){
            
                1 {5}
                2 {1}
                3 {1}
                4 {.5}
                5 {.1}

            }

        }

    }

    [pscustomobject]@{

        Class = $GemTable.Result.Description
        Item = $TypeOfGemTable.Result.Stone
        Description = $TypeOfGemTable.Result.Description
        ReputedMagicalProperty = $TypeOfGemTable.Result.ReputedMagicalProperty
        BaseValue = $TypeOfGemTable.Result.Value
        ModifierRolls = $ModifierRolls
        ExplodedValue = if($Explode -ge 1){"$($Explode)"}else{'-'}
        ModifiedValue = if($NewValue -ne $Null){$NewValue}else{'-'}

    }

}

function Get-Jewelry {

    param(

        [Parameter(Mandatory=$False)]
        [int]$JewelryTableRoll,
        [Parameter(Mandatory=$False)]
        [int]$JewelryTablePieceRoll,
        [Parameter(Mandatory=$False)]
        [int]$ReRolls,
        [Parameter(Mandatory=$False)]
        [bool]$MaxValue

    )

    $GemBonusValue = 0
    $NewRoll = $Null
    if(!$Rerolls){$Rerolls = 0}
    $Rerolls = $Rerolls
    $Exceptional = $Null
    $Variance = 0

    if(!$JewelryTableRoll){$JewelryTableRoll = (Get-D100Roll).Result}

    $JewelryTable = Get-JewelryTableRoll -Roll $JewelryTableRoll

    $Variance = switch($JewelryTable.Result.VarianceDie){
    
        6 {(Get-D6Roll).Result * $JewelryTable.Result.VarianceValue}
        8 {(Get-D8Roll).Result * $JewelryTable.Result.VarianceValue}
        10 {(Get-D10Roll).Result * $JewelryTable.Result.VarianceValue}

    }

    $Value = $JewelryTable.Result.BaseValue + $Variance

    if($MaxValue){

        $Variance = $JewelryTable.Result.VarianceDie * $JewelryTable.Result.VarianceValue
        $Value = $JewelryTable.Result.TopValue
        
    }

    $Type = "$((Get-JewelryPieceRoll -Roll $JewelryTablePieceRoll).Description)"

    if((Get-D10Roll).Result -eq 1){$Exceptional = $True}

    if(($Exceptional -eq $True) -and ($Value -ge $JewelryTable.Result.TopValue)){
    
        $Rerolls++
        $NewRoll = (($JewelryTable.Result.Max) + 1)
        if($NewRoll -gt 100){$NewRoll = 100}
        if($NewRoll -eq 100){Get-Jewelry -JewelryTableRoll $NewRoll -ReRolls $Rerolls -MaxValue $True}else{Get-Jewelry -JewelryTableRoll $NewRoll -Rerolls $Rerolls}
        
    }else{

        if((($JewelryTable.Result.Description -like "*gems*")) -and (Get-D8Roll).Result -eq 1){$ExceptionalGem = $True}

        if($ExceptionalGem -eq $True){
        
            $GemBonus = 1
            $GemReroll = $True

            while(($GemBonus -le 8) -and ($GemReroll -eq $True)){
            
                switch($GemBonus) {
                
                    1 {$GemBonusValue = 5000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    2 {$GemBonusValue = 10000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    3 {$GemBonusValue = 20000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    4 {$GemBonusValue = 40000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    5 {$GemBonusValue = 80000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    6 {$GemBonusValue = 160000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    7 {$GemBonusValue = 320000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}
                    8 {$GemBonusValue = 640000;if((Get-D6Roll).Result -eq 1){$GemBonus++}else{$GemReroll = $False}}

                }

            }

        }

        $Type = "$($JewelryTable.Material) $($Type.ToLower())$(if($Exceptional -eq $True){' of exceptional quality'})$(if($JewelryTable.Result.Gems -eq $True){' with gems'})$(if($GemBonusValue -gt 0){' of exceptional quality'})"
        $Value = if(($Exceptional -eq $True) -and (($Value -lt $JewelryTable.Result.TopValue))){$JewelryTable.Result.TopValue}else{$Value}
        $Value = $Value + $GemBonusValue

        [pscustomobject]@{

            Item = $Type
            BaseValue = $JewelryTable.Result.BaseValue
            Variance = $Variance
            Value = $Value
            TopValue = $JewelryTable.Result.TopValue
            GemBonus = $GemBonusValue
            Rerolls = $Rerolls

        }

    }

}

function Get-Room {

    [alias("Get-Chamber")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Level,
        
        [Parameter(Mandatory=$False)]
        [int]$Table5Roll,

        [Parameter(Mandatory=$False)]
        [int]$Table5ARoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5BRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5CRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5FRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5GRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table7Roll,

        [Parameter(Mandatory=$False)]
        [int]$Table5HRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5IRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5JRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table8ARoll,

        [Parameter(Mandatory=$False)]
        [int]$Table8BRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table8CRoll
   
    )

    if(($Level -like $Null) -or (!$Level)){$Level = 1}
    $Unusual = $False
    $Container = "N/A"
    $TreasureTrap = "N/A"
    $HiddenByIn = "N/A"
    $Treasure = @()
    $DetailedTreasure = @()
    $CircleRoll = ""
    $Pool = $False
    $PoolDescription = "N/A"
    $Shaft = $False

    if($MyInvocation.InvocationName -eq "Get-Room"){$Type = "Room"}
    if($MyInvocation.InvocationName -eq "Get-Chamber"){$Type = "Chamber"}

    if(!$Table5Roll){$Table5Roll = (Get-D20Roll).Result}
    if(!$Table5CRoll){$Table5CRoll = (Get-D20Roll).Result}
    if(!$Table5FRoll){$Table5FRoll = (Get-D20Roll).Result}
    if(!$Table5GRoll){$Table5GRoll = (Get-D100Roll).Result}
    if(!$Table5HRoll){$Table5HRoll = (Get-D20Roll).Result}
    if(!$Table5IRoll){$Table5IRoll = (Get-D20Roll).Result}
    if(!$Table5JRoll){$Table5JRoll = (Get-D20Roll).Result}
    if(!$Table8ARoll){$Table8ARoll = (Get-D20Roll).Result}
    if(!$Table8BRoll){$Table8BRoll = (Get-D20Roll).Result}
    if(!$Table8CRoll){$Table8CRoll = (Get-D20Roll).Result}
   
    if($Table5Roll -ge 18){$Unusual = $True}
    if($Unusual){
       
        if(!$Table5ARoll){$Table5ARoll = (Get-D20Roll).Result}
        if(!$Table5BRoll){$Table5BRoll = (Get-D20Roll).Result}

        $5A = $Table5A.($Table5ARoll).Shape
        $5B = $Table5B.($Table5BRoll).Area
        $Area = $5B
   
    }

    if(($Type -eq "Room") -and (!$Unusual)){

        $Length = $Table5.($Table5Roll).Room.Length
        $Width = $Table5.($Table5Roll).Room.Width
        $Area = $Length * $Width
   
    }

    if(($Type -eq "Chamber") -and (!$Unusual)){

        $Length = $Table5.($Table5Roll).Chamber.Length
        $Width = $Table5.($Table5Roll).Chamber.Width
        $Area = $Length * $Width
   
    }

    #region Unusual
    if($Unusual){
   
        $Area = if($Table5BRoll -le 14){
       
            $5B
           
        }else{
       
            $i = 1

            $UnusualRoll = ''
            $UnusualRoll = (Get-D20Roll).Result

            while($UnusualRoll -ge 15){
               
                $i++
                $UnusualRoll = (Get-D20Roll).Result

            }

            (Get-5BSpecialArea -Rerolls $i) + ($Table5B.($UnusualRoll).Area)

        }
   
        #$Type = "Unusual"
        $Length = "Unusual"
        $Width = "Unusual"

    }

    $Shape = if($Unusual){$5A}else{$Table5.($Table5Roll)."$($Type)".Shape}
    if($Shape -eq "Circular"){$CircleRoll = (Get-D20Roll).Result}
    if(($Shape -eq "Circular") -and ($CircleRoll -le 5)){$Pool = $True}
    if(($CircleRoll -eq 8) -or ($CircleRoll -eq 9) -or ($CircleRoll -eq 10)){$Shaft = $True}

    if($Pool -eq $True){
    
        $PoolRoll = ''
        $PoolRoll = Get-Table8ARoll -Roll $Table8ARoll

        if($PoolRoll.Roll -le 10){$PoolDescription = "Pool"}
        if(($PoolRoll.Roll -ge 11) -and ($PoolRoll.Roll -le 18)){$Monster = $True;$PoolDescription = "Pool"}
        if($PoolRoll.Description -like "*treasure*"){$TreasurePresent = $True;$PoolDescription = "Pool"}
        if($PoolRoll.Description -like "*Magical*"){$PoolDescription = "Magical pool: $((Get-Table8CRoll -Roll $Table8CRoll).PoolSpecificScenario)"}
        
    }else{
    
        $Pool = "N/A"
        
    }
    #endregion

    #region Exits
    if(($Shape -like "Square") -or ($Shape -like "Rectangular")){$SpecificNumberOfExits = Get-SpecificNumberOfExits -Roll $Table5CRoll -Type $Type -Width $Width -Length $Length}else{$SpecificNumberOfExits = Get-SpecificNumberOfExits -Roll $Table5CRoll -Type $Type -Area $Area}
    
    $ExitLocations = @()
    $SecretDoorLocations = @()

    if($SpecificNumberOfExits.Exits -gt 0){1..$SpecificNumberOfExits.Exits | %{$ExitLocations += (Get-ExitLocation).Description}}else{$ExitLocations = "N/A"}
    if($SpecificNumberOfExits.SecretDoors -gt 0){1..$SpecificNumberOfExits.SecretDoors | %{$SecretDoorLocations += (Get-ExitLocation).Description}}else{$SecretDoorLocations = "N/A"}
   
    $ExitDirections = @()
    $SecretDoorDirections = @()

    if($SpecificNumberOfExits.Exits -gt 0){1..$SpecificNumberOfExits.Exits | %{(Get-ExitDirection).Description} | %{if($_ -notlike "45*"){$ExitDirections += $_}else{$ExitDirections += "$($_.split('/')[0])"}}}else{$ExitDirections = "N/A"}
    if($SpecificNumberOfExits.SecretDoors -gt 0){1..$SpecificNumberOfExits.SecretDoors | %{(Get-ExitDirection).Description} | %{if($_ -notlike "45*"){$SecretDoorDirections += $_}else{$SecretDoorDirections += "$($_.split('/')[0])"}}}else{$SecretDoorDirections = "N/A"}
    
    if(($Type -like "Room") -and ($SpecificNumberOfExits.Passage -eq $False)){$ExitType = "door"}
    if(($Type -like "Room") -and ($SpecificNumberOfExits.Passage -eq $True)){$ExitType = "passage"}
    if(($Type -like "Chamber") -and ($SpecificNumberOfExits.Passage -eq $False)){$ExitType = "passage"}
    if(($Type -like "Chamber") -and ($SpecificNumberOfExits.Passage -eq $True)){$ExitType = "door"}
    if($Shape -like "Cave"){$ExitType = "exit"}
    #endregion

    if($Shape -like "Cave"){$Type = "Cave"}

    $Contents = Get-RoomContents -Roll $Table5FRoll

    if(($Contents.Description -like "Monster*") -or ($Monster -eq $True)){
    
        $Monster = $True
        $Monsters = (Get-Monster -Level $Level).Encounter
    
        $Contents = "Monster(s)"

    }else{
    
        $Monsters = "N/A"
        
    }

    if(($Contents.Description -like "*treasure*") -or ($TreasurePresent -eq $True)){
    
        if($Monster -eq $True){
    
            $RolledTreasure = Get-Treasure -Table5GRoll $Table5GRoll -Level $Level -RollBonus 10
            $Treasure += $RolledTreasure.Loot
            $DetailedTreasure += $RolledTreasure.DetailedLoot
            
            $Table5GRoll = (Get-D100Roll).Result
            $RolledTreasure = Get-Treasure -Table5GRoll $Table5GRoll -Level $Level -RollBonus 10
            $Treasure += $RolledTreasure.Loot
            $DetailedTreasure += $RolledTreasure.DetailedLoot

            $Contents = "Monster(s) and treasure"

        }else{
    
            $RolledTreasure = Get-Treasure -Table5GRoll $Table5GRoll -Level $Level
            $Treasure += $RolledTreasure.Loot
            $DetailedTreasure += $RolledTreasure.DetailedLoot

            $Contents = "Treasure"

        }
        
    }

    if($Contents.Description -like "Trick*"){
    
        $Trick = Get-Table7Roll -Roll $Table7Roll

        if($Trick.IllusionaryWall -like "N/A"){
        
            $Contents = $Trick.Specific
            
        }else{
        
            $Contents = "Illusionary wall hides a $($Trick.IllusionaryWall.ToLower())"
            
        }
        
    }

    if($Contents.Description -like "Special*"){
    
        $Contents = $Contents.Stairs

    }

    if($Contents.Description -like "Empty"){$Contents = "Empty"}
    if(($Pool -eq $True) -and ($Contents -ne "Empty")){$Contents = "$($Contents) with pool"}
    if(($Pool -eq $True) -and ($Contents -eq "Empty")){$Contents = "Pool"}
    #I am not 100% sure what a "shaft" is supposed to be/how it works. Suprise, surprise, there is no explanation in the DMG! I tried looking for it online and in other books, and mostly the word is used as a part of a weapon, rather than a feature of a dungeon. My best guess based on the available information, is that it is functionally similar to a chute, which is a one way staircase downward. No specifics on how many levels, of course!
    if(($Shaft -eq $True) -and ($Contents -ne "Empty")){$Contents = "$($Contents) with shaft"}
    if(($Shaft -eq $True) -and ($Contents -eq "Empty")){$Contents = "Shaft"}

    if($Contents -like "*treasure*"){
    
        $Container = (Get-Table5HRoll -Roll $Table5HRoll).Description

        #region This is logic I made up. The DMG indicates that treasure being guarded or hidden is to be rolled "if desired". I think that having one or the other 100% of the time is silly and unintended. I also think that allowing for an escalating probability of dangerous/hidden treasure to increase as the dungeon level increases makes sense, so I have wirrten some logic for what sounds fair to me below. This may need to be amended/revisited in the future.
        if(((((Get-D100Roll).Result) -le (50 + ($Level - 1) * 10))) -and ($Container -notlike "Loose")){
        #endregion
        
            if((Get-D20Roll).Result -le 8){$TreasureTrap = (Get-Table5IRoll -Roll $Table5IRoll).Description}else{$HiddenByIn = (Get-Table5JRoll -Roll $Table5JRoll).Sentence}
            
        }
        
    }else{
    
        $Treasure = "N/A"
        $DetailedTreasure = "N/A"

    }

    [pscustomobject]@{
           
        Level = $Level
        Type = $Type
        Length = $Length
        Width = $Width
        Area = $Area
        Shape = $Shape
        Exits = "$($SpecificNumberOfExits.Exits) $($ExitType)$(if(($SpecificNumberOfExits.Exits -ne 1) -and ($SpecificNumberOfExits.Exits -ne "?")){"s"})"
        ExitLocations = $ExitLocations
        ExitDirections = $ExitDirections
        SecretDoors = $SpecificNumberOfExits.SecretDoors
        SecretDoorLocations = $SecretDoorLocations
        SecretDoorDirections = $SecretDoorDirections
        Contents = $Contents
        Monsters = $Monsters
        Container = $Container
        Treasure = $Treasure
        TreasureTrap = $TreasureTrap
        TreasureHiddenByIn = $HiddenByIn
        DetailedTreasure = $DetailedTreasure
        PoolDetails = $PoolDescription

    }
   
}

function Get-Passage {

    [alias("Get-Hallway")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Table1Roll,
        
        [Parameter(Mandatory=$False)]
        [int]$Level

    )

    $NotFirstTime = $False
    $Width = ''
    #To do: Decide how/when to check for width. For now my rule is that the width is only checked again if the passage changes direction- they are straight, uniform hallways otherwise. If I can find something in the original text or a popular reading that contradicts this I will update my logic.
    $Width = (Get-Table3ARoll).Description.Replace("'","")
    if($Width -like "SPECIAL*"){
    
        $Table3BRoll = Get-Table3BRoll
        if($Table3BRoll.SpecificSpecial -like "N/A"){$Table3BRoll = $Table3BRoll.Description.Replace("'","")}else{$Table3BRoll = $Table3BRoll.SpecificSpecial}
        $Width = "$($Table3BRoll)".split(",")[0].Replace("'","")
        $PassageSegments += "$($Table3BRoll)".split(",")[1].Trim().Substring(0, 1).ToUpper() + "$($Table3BRoll)".split(",")[1].Trim().Substring(1)
        
    }

    if((!$Level) -or ($Level -like "")){$Level = 1}
    
    $PassageSegments = @()
    $PassageSegments += [pscustomobject]@{SegmentLength = 30;Width = "$($Width)"}

    if(!$Table1Roll){$Table1Roll = (Get-D20Roll).Result}

    $Loopies = 0

    while(($PassageSegments[-1] -notlike "Door") -and ($PassageSegments[-1] -notlike "Chamber") -and ($PassageSegments[-1] -notlike "Stairs*") -and ($PassageSegments[-1] -notlike "*dead end*") -and ($PassageSegments[-1] -notlike "*'s")){

        if($NotFirstTime -eq $True){$Table1Roll = (Get-D20Roll).Result}

        if($Table1Roll -le 2){$PassageSegments += [pscustomobject]@{SegmentLength = 60;Width = "$($Width)"}}
        if(($Table1Roll -ge 3) -and ($Table1Roll -le 5)){$PassageSegments += "Door"}
        if(($Table1Roll -ge 6) -and ($Table1Roll -le 10)){
        
            $SidePassage = "$((Get-Table3Roll).Description.Replace(" degrees","°"))"

            $PassageSegments += "$(if($SidePassage -notlike "*'s"){"Side Passage: "})$($SidePassage)"
            if($SidePassage -notlike "*'s*"){$PassageSegments += [pscustomobject]@{SegmentLength = 30;Width = "$($Width)"}}
            
        }
        if(($Table1Roll -ge 11) -and ($Table1Roll -le 13)){
        
            $PassageSegments += "Passage turns $((Get-Table4Roll).Description.ToLower().Replace(" degrees","°"))"
            
            $Width = (Get-Table3ARoll).Description.Replace("'","")
            
            if($Width -like "SPECIAL*"){
    
                $Table3BRoll = Get-Table3BRoll
                if($Table3BRoll.SpecificSpecial -like "N/A"){$Table3BRoll = $Table3BRoll.Description.Replace("'","")}else{$Table3BRoll = $Table3BRoll.SpecificSpecial}
                $Width = "$($Table3BRoll)".split(",")[0].Replace("'","")
                $PassageSegments += "$($Table3BRoll)".split(",")[1].Trim().Substring(0, 1).ToUpper() + "$($Table3BRoll)".split(",")[1].Trim().Substring(1)
        
            }

            $PassageSegments += [pscustomobject]@{SegmentLength = 30;Width = "$($Width)"}
            
        }
        if(($Table1Roll -ge 14) -and ($Table1Roll -le 16)){$PassageSegments += "Chamber"}
        if($Table1Roll -eq 17){
        
            $Stairs = ""
            $Stairs = Get-Table6Roll
            
            if($Stairs.SpecificStairs -notlike "N/A"){
            
                $Stairs = $Stairs.SpecificStairs
                
            }else{
            
                $Stairs = $Stairs.Description
                
            }
            
        $PassageSegments += "Stairs: $($Stairs)"

        }

        if($Table1Roll -eq 18){$PassageSegments += Get-DeadEnd}
        if($Table1Roll -eq 19){
        
            $Trick = ""
            $Trick = Get-Table7Roll
            
            if($Trick.IllusionaryWall -notlike "N/A"){
            
                $Trick = "Illusionary wall hides a $($Trick.IllusionaryWall.ToLower())"
                
            }else{
            
                $Trick = "$($Trick.Specific)"
                
            }

            $PassageSegments += "$($Trick)"

            $PassageSegments += [pscustomobject]@{SegmentLength = 30;Width = "$($Width)"}
        
        }

        if($Table1Roll -eq 20){$PassageSegments += "$((Get-Monster -Level $Level).Encounter)"}
        
        if(($PassageSegments[0].SegmentLength -and $PassageSegments[1].SegmentLength) -and ($PassageSegments[0].Width -eq $PassageSegments[1].Width)){$PassageSegments[1].SegmentLength = $PassageSegments[0].SegmentLength + $PassageSegments[1].SegmentLength;$PassageSegments = @($PassageSegments | Select-Object -Skip 1)}
        if(($PassageSegments[-2].SegmentLength -and $PassageSegments[-1].SegmentLength) -and ($PassageSegments[-2].Width -eq $PassageSegments[-1].Width)){$PassageSegments[-2].SegmentLength = $PassageSegments[-2].SegmentLength + $PassageSegments[-1].SegmentLength;$PassageSegments = @($PassageSegments | Select-Object -SkipLast 1)}
        if(($PassageSegments[-2].SegmentLength -and $PassageSegments[-3].SegmentLength) -and ($PassageSegments[-2].Width -eq $PassageSegments[-3].Width)){$PassageSegments[-3].SegmentLength = $PassageSegments[-2].SegmentLength + $PassageSegments[-3].SegmentLength;$LastBit=$PassageSegments[-1];$PassageSegments = @($PassageSegments | Select-Object -SkipLast 2);$PassageSegments += $LastBit}

        $Loopies++
        $NotFirstTime = $True

    }

    $PassageSegments
    #$Loopies

}

function Get-DeadEnd {

    param(

        [Parameter(Mandatory=$False)]
        [int]$NumberOfSecretDoors

    )

    $SecretDoorString = ""

    if((!$NumberOfSecretDoors) -or ($NumberOfSecretDoors -eq $Null)){

        $SecretDoors = 0

        #See DMG pg. 170 Appendix A Table I. result 18 and DMG pg. 171 Appendix A Table V. C. footnote / Table V. D. footnote for odds on finding secret doors in this situation
        1..3 | %{if((Get-D20Roll).Result -le 5){$SecretDoors++}}

    }else{
    
        $SecretDoors = $NumberOfSecretDoors

    }

    if($SecretDoors -gt 0){
    
        $SecretDoorLocations = @()

        if($SecretDoors -eq 1){
                    
            $SecretDoorLocations += (Get-Table5DRoll -DeadEnd $True).Description
            
        }

        if($SecretDoors -eq 2){

            $SecretDoorLocations += (Get-Table5DRoll -DeadEnd $True).Description

            $NewDeadEndWallLocation = ""
            
            while(($NewDeadEndWallLocation -like "") -or ($SecretDoorLocations -contains $NewDeadEndWallLocation)){
            
                $NewDeadEndWallLocation = (Get-Table5DRoll -DeadEnd $True).Description

            }

            $SecretDoorLocations += $NewDeadEndWallLocation

        }

        if($SecretDoors -eq 3){

            $SecretDoorLocations += "Left wall"
            $SecretDoorLocations += "Right wall"
            $SecretDoorLocations += "Opposite wall"

        }

    }

    $SecretDoorString = ": ($($SecretDoorLocations -join ", "))".ToLower()

    "Dead end$(if($SecretDoors -gt 0){", $($SecretDoors) secret door$(if($SecretDoors -gt 1){"s"})$(if($SecretDoors -gt 0){"$($SecretDoorString)"})"})"

}

###################################

#To do:

#How many specifics should I pre-determine? Should I roll for all instances of a range, such as for damage? This will require some deliberation...
#Monsters beyond level 3
#Add multi-classes NPCs? Worry more about race/class combinations? See DMG page 176
#Magic item tables
#Get-Passage
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

###

Mad props to https://1eonline.info/

###

"Chambers are areas where the exits are passages; rooms are areas where the exits are doors"

-SuStel, https://forum.rpg.net/index.php?threads/lets-read-the-ad-d-dungeon-masters-guide-1e.841119/page-28

###

 "Hallways serve multiple purposes:

    They let the DM explain why nearby monsters don't join in combat. If all the rooms were adjacent, monsters in nearby rooms would peek in to see what all the ruckus was about. (The DM can still do this, but this gives them plausible deniability if they don't want to.)

    Hallways take up a little more time during exploration, making the party mark more torches

    Traps and secret passages fit quite nicely into hallways. They keep rooms from being too crowded.

    If the party needs to flee from the dungeon, hallways increase the distance to the exit and give the DM a little more opportunity to have something move into a previously-explored area."

-thomar, https://www.reddit.com/r/osr/comments/17avhwq/whats_with_all_the_corridors/

###

https://odd74.proboards.com/thread/11578/gygax-od-additions

https://www.dropbox.com/scl/fi/9zcleb51bh3tcmdf61b45/Gygax-OD-D-Additions.pdf?rlkey=bikxgoxbi03au3cnlp4hyv0oe&e=1&dl=0
https://pastebin.com/s9yCRPGq

https://oldschoolessentials.necroticgnome.com/srd/index.php/Dungeon_Adventuring

###

"It's obvious why treasure isn't lying open; if it were, someone would have taken it by now."
https://initiativeone.blogspot.com/2013/08/hiding-treasure.html

###

On traps:
https://dmdavid.com/tag/the-history-of-traps-in-dungeons-dragons/
#>
