#Write a script to calculate a dog's age in human years: for the first two years, a dog year is equal to 10.5 human years. After that, each dog year equals 4 human years.
param($s)
$sum=0
[string]$a=''
$i=0
do{
    if ($i -lt 2 ){
        $sum += 10.5
        $a += $sum.ToString()
        $a += ' ';
    }else{
        $sum += 4
        $a += $sum.ToString()
        $a += ' '
    }
    $i++
   
}while($i -lt $s)
$a