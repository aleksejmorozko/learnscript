# Create two-dimensional strong defined string array.
$a=@(
    ("Hi","Hello","Bye","Good Night"),
    ("Lake","River","WaterFall","Sea")
)
$a[0][2]
#-------------------------------------------
$a = New-Object 'object[,]' 2,4
$a[0,0]="Hi"; $a[0,1]="Hello"; $a[0,2]="Bye"; $a[0,3]="Good Night";
$a[1,0]="Lake"; $a[1,1]="River"; $a[1,2]="WaterFall"; $a[1,3]="Sea";
$a[0,2]
$a[1,2]