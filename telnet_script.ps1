# Read the host and port details from csv file 

$checklist = import-csv checklist.csv

$OutArray = @()

# Perform telnet test
Import-Csv checklist.csv |`
ForEach-Object { 
    try {
        $rh = $_.remoteHost
        $p = $_.port
        $socket = new-object System.Net.Sockets.TcpClient($rh, $p)
    } catch [Exception] {
        $myobj = "" | Select "remoteHost", "port", "status"
        $myobj.remoteHost = $rh
        $myobj.port = $p
        $myobj.status = "failed"
        Write-Host $myobj
        $outarray += $myobj
        $myobj = $null
        return
    }
    $myobj = "" | Select "remoteHost", "port", "status"
    $myobj.remoteHost = $rh
    $myobj.port = $p
    $myobj.status = "success"
    Write-Host $myobj
    $outarray += $myobj
    $myobj = $null
    return
}

# Write the output with the test status to output csv file 
$outarray | export-csv -path "result.csv" -NoTypeInformation
