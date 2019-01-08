#Autor: Amin Fas
#Datum: 08.01.2019
#Company: IFP Informatik AG
#Funktion: Überprüft Veeam for Windows (Client Edition) ob das Backup erfolgreich ist.

$BackupZyklusTage = "Mi:DI:MI:DO"
$AnzhlFehler = 0 
$FehlerTag

switch($BackupZyklusTage.Split(':')){
    
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
    
    $FehlerTag = Write-Host "Montagssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
    $FehlerTag = Write-Host "Montagssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1

    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
    $FehlerTag  = Write-Host "Ueberpruefung fuer Montagssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1

    }


    }else{
        $FehlerTag  = Write-Host "Montag wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
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
    
        $FehlerTag = Write-Host "Dienstagssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
        $FehlerTag = Write-Host "Dienstagssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
        $FehlerTag = Write-Host "Ueberpruefung fuer Dienstagssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1
    }


    }else{
        $FehlerTag = Write-Host "Dienstag wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
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
    
        $FehlerTag = Write-Host "Mittwochssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
        $FehlerTag = Write-Host "Mittwochssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
        $FehlerTag = Write-Host "Ueberpruefung fuer Mittwochssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1
    }


    }else{
        $FehlerTag = Write-Host "Mittwoch wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
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
    
        $FehlerTag = Write-Host "Donnerstagssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
        $FehlerTag = Write-Host "Donnerstagssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
        $FehlerTag = Write-Host "Ueberpruefung fuer Donnerstagssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1
    }


    }else{
        $FehlerTag = Write-Host "Donnerstag wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
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
    
        $FehlerTag = Write-Host "Freitagssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
        $FehlerTag = Write-Host "Freitagssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
        $FehlerTag = Write-Host "Ueberpruefung fuer Freitagssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1
    }


    }else{
        $FehlerTag = Write-Host "Freitag wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
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
    
        $FehlerTag = Write-Host "Samstagssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
        $FehlerTag = Write-Host "Samstagssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
        $FehlerTag = Write-Host "Ueberpruefung fuer Samstagssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1
    }


    }else{
        $FehlerTag = Write-Host "Samstag wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
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
    
        $FehlerTag = Write-Host "Sonntagssicherung wurde nicht erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }

    if($CheckSuccess -ne $null -and $CheckFailed -ne $null){
    
        $FehlerTag =  Write-Host "Sonntagssicherung nur bedingt erfolgreich durchgefuehrt"
    $AnzhlFehler += 1
    }
    
    if($CheckSuccess -eq $null -and $CheckFailed -eq $null){
    
        $FehlerTag = Write-Host "Ueberpruefung fuer Sonntagssicherung konnte nicht durchgefuehrt werden"
    $AnzhlFehler += 1
    }


    }else{
        $FehlerTag = Write-Host "Sonntag wurde kein Backup ausgefuehrt!"
    $AnzhlFehler += 1
    }
    }

    Default{Write-Host 'Wochentag nicht gefunden, bitte Wochentage zusammenhängend übergeben Beispiel: MO:DI:MI:FR:SA'}
}


Write-Host "Anzahl Fehler: $AnzhlFehler"
Write-Host $FehlerTag

