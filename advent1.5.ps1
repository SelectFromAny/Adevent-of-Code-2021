[system.Int32[]]$data = Get-Content test.txt
$increase = 0
$decrease = 0
$nochange=0

$i = 2

do {
    [int]$a = $data[$i] + $data[$i-1] + $data[$i-2]
    [int]$b = $data[$i+1] + $data[$i] + $data[$i-1]

    if($b -gt $a)
    {
        $increase++
        Write-Output ($b.ToString() + " (Increased)")
    }
    elseif($i -eq 2)
    {
        Write-Output ($a.ToString() + " (N/A - No Previous measurement)")
        $nochange++
    }
    elseif($data[$i] -lt $data[$i-1])
    {
        Write-Output ($b.ToString() + " (Decreased)")
        $decrease++
    }
    else {
        Write-Output ($b.ToString() + " (No Change)")
        $nochange++
    }
    $i++

    
} until ($i -eq  ($data.count))