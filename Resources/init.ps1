Write-Output 'Starting Vtrin Server'
Start-Service VtrinServer
    
Write-Output 'Making HTTP GET call'
Invoke-WebRequest https://localhost -UseBasicParsing | Out-Null

Write-Output 'Flushing log file'
netsh http flush logbuffer | Out-Null

Write-Output 'Tailing log file'
Get-Content -path 'C:\inetpub\wwwroot\view\mia_2017.log' -Tail 1 -Wait