$data =(get-content .\7input.txt).split(",") | %{[Convert]::ToInt32($_)} | Sort-Object


[int]$minmoves = $null

$measure = $data | Measure-Object -Minimum -Maximum

$groups = $data | group |sort -Descending count
$range = $measure.Minimum..$measure.Maximum

foreach ($i in $range)
{
    $moves = 0
    foreach ($group in $groups) {
        $_name = [Convert]::ToInt32($group.name)
        $_count = [Convert]::ToInt32($group.count)
        if($_name -lt $i)
        {
            $_delta = $i - $_name
        }
        elseif($_name -gt $i)
        {
            $_delta = $_name - $i
        }
        else{
            continue
        }
        $moves += ($_delta * $_count)
    }
    if($i -eq 1 -or $moves -lt $minmoves)
    {
        $minmoves = $moves
    }
}
$minmoves