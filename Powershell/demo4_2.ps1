# Put three different hash-tables in array. Retrieve 
# value from the second key in third hash table in array.

$h1=@{"BY" = "Belarus"; "DE" = "Deutchland"; "PL" = "Poland"}
$h2=@{"three" = "3"; "five" = "5"; "seven" = "7"; "eight" = "9"}
$h3=@{"A" = "Alpha"; "B" = "Beta"; "G" = "Gamma"; "D" = "Delta"}
$a=@()
$a += $h1; $a += $h2; $a += $h3;
$i=0;
foreach($aa in $a[2].Values){
    if($i -eq 1){
        Write-Output $aa
    }
    $i++  
}