$data =(get-content .\7input.txt).split(",") | %{[Convert]::ToInt32($_)} | Sort-Object

$measure = $data | Measure-Object -Minimum -Maximum

$groups = $data | group |sort -Descending count
$range = $measure.Minimum..$measure.Maximum

$data = $data  | sort
function getMedian($sortedData)
{
        #get median
    if ($sortedData.count%2) {
        #odd
        return $sortedData[[math]::Floor($sortedData.count/2)]
    }else {
        #even
        return ($sortedData[$sortedData.Count/2],$sortedData[$sortedData.count/2 - 1] |measure -Average).average
    }    
}

$q1median = getMedian -sortedData $data[0..([math]::Floor(($data.Length/2 - 1)))]
$q3median = getMedian -sortedData $data[([math]::Floor(($data.Length/2 + 1)))..($data.Length - 1)]

[int]$minmoves = $null

$measure = $data | Measure-Object -Minimum -Maximum

$groups = $data | group |sort -Descending count
$range = $q1median..$q3median

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
        $moves += ((1..$_delta | Measure-Object -Sum).Sum * $_count)
    }
    if($i -eq $range[0] -or $moves -lt $minmoves)
    {
        $minmoves = $moves
    }
    Write-Host $i + " : " + $minmoves
}
$minmoves
