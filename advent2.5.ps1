$data = import-csv .\2input.txt -Delimiter " " -Header $('Direction', 'Count')
$horiz = 0
$vert = 0
$aim = 0

foreach($move in $data)
{
    if($move.Direction -eq "forward")
    {
        $horiz += $move.Count
        $vert += ($aim * $move.Count)
    }
    elseif ($move.Direction -eq "down") {
        #$vert += $move.Count
        $aim += $move.count
    }
    else {
        #$vert -= $move.count
        $aim -= $move.count
    }
    
    Write-Output ("command: " + $($move.Direction + " "+ $move.Count ) + " depth:" + $vert + " Horiz: " +  $horiz + ' aim: ' + $aim)
}

$horiz * $vert