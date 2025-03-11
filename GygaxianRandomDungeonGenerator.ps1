function Get-Room {

    [alias("Get-Chamber")]
    param(

        [Parameter(Mandatory=$False)]
        [int]$Table5Roll,

        [Parameter(Mandatory=$False)]
        [int]$Table5ARoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5BRoll,

        [Parameter(Mandatory=$False)]
        [int]$Table5CRoll
    
    )

    $Unusual = $False

    if(($MyInvocation.InvocationName -eq "Get-Room") -and ($Type -eq $Null)){$Type = "Room"}
    if(($MyInvocation.InvocationName -eq "Get-Chamber") -and ($Type -eq $Null)){$Type = "Chamber"}
    if(!$Type){$Type = @("Chamber","Room")[(Get-Random -Minimum 0 -Maximum 2)];$Unspecified = $True}

    if(!$Table5Roll){$Table5Roll = (Get-D20Roll).Result}
    
    if($Table5Roll -ge 18){$Unusual = $True}
    if($Unusual){
        
        if($Table5ARoll){$5A = $NewTable5A.($Table5ARoll).Description}else{$5A = $NewTable5A.((Get-D20Roll).Result).Description}
        if($Table5BRoll){$5B = $NewTable5B.($Table5BRoll).Description}else{$5B = $NewTable5B.((Get-D20Roll).Result).Area}
    
    }

    if(($Type -eq "Room") -and (!$Unusual)){

        $Length = $NewTable5.($Table5Roll).Room.Length
        $Width = $NewTable5.($Table5Roll).Room.Width
        $Area = $Length * $Width
    
    }

    if(($Type -eq "Chamber") -and (!$Unusual)){

        $Length = $NewTable5.($Table5Roll).Chamber.Length
        $Width = $NewTable5.($Table5Roll).Chamber.Width
        $Area = $Length * $Width
    
    }

    if($Unusual){
    
        $Area = if($Table5BRoll -le 14){
        
            $NewTable5B.($Table5BRoll).Area
            
        }else{
        
            $i = 1

            $UnusualRoll = ''
            $UnusualRoll = (Get-D20Roll).Result

            while($UnusualRoll -ge 15){
                
                $i++
                $UnusualRoll = (Get-D20Roll).Result

            }

            (Get-5BSpecialArea -Rerolls $i) + ($NewTable5B.($UnusualRoll).Area)

        }
    
        $Type = "Unusual"
        $Length = "Unusual"
        $Width = "Unusual"

    }

    [pscustomobject]@{
            
        Type = $Type

        Dimensions = [pscustomobject]@{

            Length = $Length
            Width = $Width
            Area = $Area

        }
            
        Shape = if($Unusual){$5A}else{$NewTable5.($Table5Roll)."$($Type)".Shape}

        Exits = [pscustomobject]@{

            Number = if($Table5CRoll){(Get-Table5CRoll -Roll $Table5CRoll -RoomArea $Area).Description}else{(Get-Table5CRoll -RoomArea $Area).Description}

            Locations = ''

        }

    }
   
}
