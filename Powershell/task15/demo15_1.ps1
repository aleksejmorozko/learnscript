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

function Write-ColoredMessage {
    [CmdletBinding()]
    param (
        [string[]]$Text,
        [switch]$Blue,
        [switch]$Red,
        [switch]$Green,
        [switch]$Yellow
    )
    if($Blue -eq $true){
        $color = 'Blue'
    }elseif ($Red -eq $true) {
        $color = 'Red'
    }elseif ($Green) {
        $color='Green'
    }elseif ($Yellow) {
        $color='Yellow'
    }
    return(Write-Host $Text -ForegroundColor $color)
}
Write-ColoredMessage -Text "Hi" -Red
