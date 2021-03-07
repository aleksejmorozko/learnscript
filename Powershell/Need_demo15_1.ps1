#Create a function that will get a string and one of several switch parameters 
#and return the text from string with the color passed with switch parameter.

# Example 1
# --Write-ColoredMessage -Text "Hello there!" -Red
# Returns
# --Hello there!
#---------------
# Example 1
# --Write-ColoredMessage -Text "Hello there!" -Blue
# Returns
# --Hello there!

function Write-ColorMessage {
    [CmdletBinding()]
    param (
        [string[]]$Text,
        [string]$Blue='Blue'
    )
    #$Text
    #$col=($col -replace "-",'')
    return(Write-Host $Text -ForegroundColor )
}
Write-ColorMessage -Text "Hi" -Blue
