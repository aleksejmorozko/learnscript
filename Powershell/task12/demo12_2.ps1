# Write a script to create hash-tables based on data that stored in files from task 1.

$h=@{}
Import-Csv D:\EPAM\course_fundamentals\folder\crome.csv | %{
    $h.Add($_.Id, $_.Name)
}
$h