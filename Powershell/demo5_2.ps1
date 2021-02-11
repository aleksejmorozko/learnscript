# Write a PowerShell class which has two methods SetString() 
# and PrintString(). SetString() accept a string from the 
# user and PrintString() print the string in upper case.
class CustomObj {
    [string]$str

    CustomObj(){
    }

    SetString( [string]$str ){
        $this.str = $str
    }
    [string]PrintString(){
        return $this.str.ToUpper()
    }
}