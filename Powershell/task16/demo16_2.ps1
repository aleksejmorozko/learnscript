# Write an advanced function to delete file from a specific 
# folder if file size greater then specified size in Kb.

function deleteFiles {
    param (
        [string[]]$Dest,
        $Size
    )    
    foreach($item in (Get-ChildItem -Path $Dest -File)){
        if ($item.Length/1024 -gt $Size){
            Remove-Item $item
        } 
    }
}
deleteFiles -Dest D:\EPAM\course_fundamentals\Powershell\folder -Size 300