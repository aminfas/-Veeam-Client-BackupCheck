#Autor: Amin Fas
#Datum: 08.01.2019
#Company: IFP Informatik AG
#Funktion: Überprüft Veeam for Windows (Client Edition) ob das Backup erfolgreich ist.

[int]$Dayback = $args[0]
$BackupZyklusTage = $args[1]

switch($Zyklus.Split(':')){

    
    'MO'{
    $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Montag"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Montagssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Montagssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Montagssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Montagssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Montag wurde kein Backup ausgefuehrt!"
    }

    }
    
    'DI'{
    $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Dienstag"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Dienstagssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Dienstagssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Dienstagssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Dienstagssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Dienstag wurde kein Backup ausgefuehrt!"
    }
    }
    
    'MI'{
    $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Mittwoch"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Mittwochssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Mittwochssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Mittwochssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Mittwochssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Mittwoch wurde kein Backup ausgefuehrt!"
    }
    }
    
    'DO'{
        $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Donnerstag"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Donnerstagssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Donnerstagssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Donnerstagssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Donnerstagssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Donnerstag wurde kein Backup ausgefuehrt!"
    }
    }
    
    'FR'{
    $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Freitag"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Freitagssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Freitagssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Freitagssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Freitagssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Freitag wurde kein Backup ausgefuehrt!"
    }
    }
    
    'SA'{
    
    $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Samstag"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Samstagssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Samstagssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Samstagssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Samstagssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Samstag wurde kein Backup ausgefuehrt!"
    }
    }

    'SO'{
    $Checkday =  Get-EventLog -LogName "Veeam Agent" -Newest 7 | Select-Object @{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} | Select-Object TimeGenerated -ExpandProperty TimeGenerated
    if($Checkday -like "Sonntag"){
    
    $CheckSuccess = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*success*"}
   
    $CheckFailed = Get-EventLog -LogName "Veeam Agent" -Newest 7 |   select-object EntryType,message,@{n='TimeGenerated';e={Get-Date ($_.timegenerated) -UFormat %A}} |`
    Where-Object {$_.message -like "*fail*"}

    if($CheckSuccess -ne $null -and $CheckFailed -eq $null){
    Write-Host "Sonntagssicherung erfolgreich durchgefuehrt"
    }

    if($CheckSuccess -eq $null -and $CheckFailed -ne $null){
    
    Write-Host "Sonntagssicherung wurde nicht erfolgreich durchgefuehrt"
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    Write-Host "Sonntagssicherung nur bedingt erfolgreich durchgefuehrt"

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    Write-Host "Ueberpruefung fuer Sonntagssicherung konnte nicht durchgefuehrt werden"

    }


    }else{
    Write-Host "Sonntag wurde kein Backup ausgefuehrt!"
    }
    }

    Default{Write-Host 'Wochentag nicht gefunden, bitte Wochentage zusammenhängend übergeben Beispiel: MO:DI:MI:FR:SA'}
}

