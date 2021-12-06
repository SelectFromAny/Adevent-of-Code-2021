$data = (get-content .\6input.txt).split(",")

$days = 0

do {
    $i=0
    $length = $data.Length
    do {

        if($data[$i] -eq 0)
        {
            $data[$i] = 6
            $data += 8
        }
        else{
            $data[$i] -=1
        }
       
        $i++
    } while ($i -lt $length)


$days++

} while ($days -lt 80)
$data.count