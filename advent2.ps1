$data = import-csv 2input.txt -Delimiter " " -Header $('Direction', 'Count')
$horiz = 0
$vert = 0

foreach($move in $data)
{
    if($move.Direction -eq "forward")
    {
        $horiz += $move.Count
    }
    elseif ($move.Direction -eq "down") {
        $vert += $move.Count
    }
    else {
        $vert -= $move.count
    }
}

$horiz * $vert