$data = get-content .\3input.txt 
$leng = $data[0].length
$i=0
[string]$oxrgx="^"
[string]$co2rgx="^"
do {
    [array]$hldox=$null
    [array]$hldco2=$null
    foreach ($line in $data)
    {
        if($line -match $oxrgx )
        {
            $hldox += $line[$i]
        }
        if($line -match $co2rgx )
        {
            $hldco2 += $line[$i]
        }
    }
    
    #Group and find the 
    $grp = $hldox | Group-Object | Sort-Object Count -Descending
    if ($grp[0].count -eq $grp[1].count)
    {
        $oxrgx = [string]::Concat($oxrgx,"1")

    }
    else{
        $oxrgx = [string]::Concat($oxrgx,$grp[0].Name)

    }
   
    $grp = $hldco2 | Group-Object | Sort-Object Count -Descending
    if ($grp[0].count -eq $grp[1].count)
    {
        $co2rgx = [string]::Concat($co2rgx,"0")
    }
    else{

        $co2rgx = [string]::Concat($co2rgx,$grp[1].name)
    }
   

    $i++

} while ($i+1 -le $leng)

$data -match $oxrgx
$data -match $co2rgx

$ox = [Convert]::ToInt32($data -match $oxrgx,2)
$co2 = [Convert]::ToInt32($data -match $co2rgx,2)

$ox
$co2
$ox * $co2
