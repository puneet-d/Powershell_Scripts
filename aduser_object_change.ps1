
Import-Module ActiveDirectory

$user = Get-Content .\user.txt
foreach ($line in $user){
Get-ADUser -Identity $line |Get-ADObject |Set-ADObject -ProtectedFromAccidentalDeletion $True
Get-ADUser -Identity $line -properties * | Export-Csv .\test.csv
}


