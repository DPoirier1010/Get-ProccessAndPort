    #dpoirier1010
    ###Will give established or listening port and their respective application

    $ip = (Get-NetIPConfiguration).IPv4Address.IPAddress
    $programs = (Get-NetTCPConnection -LocalAddress $ip | Where-Object {($_.State -eq "Established")}) ### Listen or Established
    $programs2 = (Get-NetTCPConnection -LocalAddress $ip | Where-Object {($_.State -eq "Listen")}) ### Listen or Established


    Write-Host "Checking established processes for local address  " $ip " . . . "
    Write-Host " "
    Write-Host " ... "
    Write-Host " "
    foreach ($program in $programs) {
        
        $process = (Get-Process -PID $program.OwningProcess -ErrorAction SilentlyContinue).Name
        $localPort = $program.LocalPort
        $remoteAddress = $program.RemoteAddress

        Write-Host "Name --> " $process ";Port --> " $localPort ";Remote address --> " $remoteAddress -ErrorAction SilentlyContinue

        
    }
    Write-Host " "
    Write-Host " ... "
    Write-Host " "
    Write-Host "Checking listening processes for local address  " $ip " . . . "
    Write-Host " "
    Write-Host " ... "
    Write-Host " "
    foreach ($program2 in $programs2) {
        
        $process = (Get-Process -PID $program2.OwningProcess -ErrorAction SilentlyContinue).Name
        $localPort = $program2.LocalPort
        $remoteAddress = $program2.RemoteAddress

        Write-Host "Name --> " $process ";Port --> " $localPort ";Remote address --> " $remoteAddress -ErrorAction SilentlyContinue

        
    }
    Write-Host " "
    Write-Host " ... "
    Write-Host " "

