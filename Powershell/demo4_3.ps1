# Create nested hash-table and retrieve values by keys from it.

$person=@{
    Name = "Alex"
    age = 34
    location = @{
        country = "Belarus"
        city = "Gomel"
    }
}
$person.location.country
$person.location.city