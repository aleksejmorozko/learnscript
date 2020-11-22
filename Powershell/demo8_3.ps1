#Write a script to calculate a dog's age in human years: for the first two years, a dog year is equal to 10.5 human years. After that, each dog year equals 4 human years.
param($s)
if($s -le 2){
    $s=$s*2
}else{
    $s=($s-1)*4
}
write-output($s)