$user = Get-Content .\Desktop\user.txt
foreach ($line in $user){
Get-ADUser -Identity $line |Get-ADObject |Set-ADObject -ProtectedFromAccidentalDeletion $True
Get-ADUser -Identity $line -properties * | Export-Csv .\Desktop\test.csv
}


