$data = Get-Content test.txt
$increase = 0
$decrease = 0
$nochange=0

$i = 0

do {
    if($data[$i] -gt $data[$i-1])
    {
        $increase++
        Write-Output ($data[$i] + " (Increased)")
    }
    elseif($i -eq 0)
    {
        Write-Output ($data[$i] + " (N/A - No Previous measurement)")
        $nochange++
    }
    elseif($data[$i] -lt $data[$i-1])
    {
        Write-Output ($data[$i] + " (Decreased)")
        $decrease++
    }
    else {
        Write-Output ($data[$i] + " (No Change)")
        $nochange++
    }
    $i++

    
} until ($i -eq  ($data.count))