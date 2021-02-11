# Write a script to sort a list of elements using the bubble sort algorithm. 
# Make output in console for each sort steps and could be controlled by 
# Verbose parameter (user can choose if he would like to see output).

[int[]]$a=@(1, 5, 6, 2, 3, 4, 8, 0)
function SortBuble {
    param (
        $aa
    )
    $max=0;
    for ($i = 0; $i -lt $aa.length; $i++) {
        for ($j = 0; $j -lt $aa.length-1; $j++) {
            if($aa[$j] -gt $aa[$j+1]){
                $max=$aa[$j]; 
                $aa[$j]=$aa[$j+1];
                $aa[$j+1]=$max
                Write-Output "Change $($aa[$($j+1)]) by $($aa[$j]), from position $j to position $($j+1)"
            }
        }
    }  
}
SortBuble $a