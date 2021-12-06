$data = get-content .\3input.txt 
$leng = $data[0].length
$i=0
[string]$gama = $null
[string]$ep=$null
do {
    [array]$hld=$null
    foreach ($line in $data)
    {
        $hld += $line[$i]
    }

    $grp = $hld | Group-Object | Sort-Object Count -Descending
   
    $gama = [string]::Concat($gama,$grp[0].Name)
    
    $ep = [string]::Concat($ep,$grp[1].name)

    $i++

} while ($i+1 -le $leng)

$gama
$ep

$gd = [Convert]::ToInt32($gama,2)
$ed = [Convert]::ToInt32($ep,2)

$gd *$ed