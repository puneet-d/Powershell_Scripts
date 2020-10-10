Import-Module ActiveDirectory

$user = Get-Content .\user.txt
foreach ($line in $user){
try{
	Get-ADUser -Identity $line |Get-ADObject |Set-ADObject -ProtectedFromAccidentalDeletion $True
	Get-ADUser -Identity $line -properties * | Export-Csv .\test.csv
}
catch{
	Write-Host "User $line is not available."
}
}
