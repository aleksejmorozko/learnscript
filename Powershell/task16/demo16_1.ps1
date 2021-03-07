# Write an advanced function to show the size of files 
# in specific folder and sort all of them by size.
function searchFolder {
    param (
        [string[]]$Path
    )
    Get-ChildItem -Path $Path -File | Select-Object Name, Length | Sort-Object Length    
}
searchFolder -Path E:\Обучение\EPAM\course_fundamentals\