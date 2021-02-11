# Write a script to find the occurrences of 10 most common words in a given text. 
# Use any article from Wikipedia as given text. Use pipelines as match as possible.

Get-Content D:\EPAM\course_fundamentals\text.txt `
    -Delimiter ' ' | Group-Object | Sort-Object `
    Count -Descending | Select-Object Name, Count -First 10