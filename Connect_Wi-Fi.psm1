

Enable-NetAdapter Wi-Fi -Confirm:0 -ErrorAction SilentlyContinue
Import-Module Connecting2
Import-Module disconnect
Disable-NetAdapter -name *Ethernet* -Confirm:0

function connect_wifi{
    if ((Get-NetAdapter Wi-fi -ErrorAction SilentlyContinue).Status -eq "Up") {
        # Disable-NetAdapter *Ethernet* -Confirm:0
        Write-Host "Wi-Fi is already Connected!" -ForegroundColor Green
        # `nSafe Browsing!
        Write-Host "Do you want to disconnect wi-fi?" -ForegroundColor Green
        Write-Host "[Y] Yes  [N] No [S] Suspend (default is "Y"): " -ForegroundColor White -NoNewline
        $value = Read-Host
        if ($value -eq "yes" -or $value.ToLower() -eq "y" -or $value.ToLower() -eq ""){
            disconnect
            
        }
        elseif($value.ToLower() -eq "no" -or $value.ToLower() -eq "n"){
            Write-Host Wi-Fi is still connected! -ForegroundColor Green
        }
        elseif ($value.ToLower() -eq "s"){
            Write-Host Disconnection suspended.`nWi-Fi remains connected. -ForegroundColor Green 
        }

    }
    elseif ($null -eq (Get-NetIPInterface -InterfaceAlias "Wi-Fi" -ErrorAction SilentlyContinue)) {
        # Disable-NetAdapter *Ethernet* -Confirm:0
        Write-Host "Wi-Fi Netadapter is Disabled!!!" -ForegroundColor Red -ErrorAction SilentlyContinue
        Write-Host "Do you want to enable Wi-Fi netadapter? "
        Write-Host "[Y] Yes  [N] No (default is "Y"): " -ForegroundColor White -NoNewline
        $wifi = Read-Host
        if ($wifi.ToLower() -eq "yes" -or $wifi.ToLower() -eq "y" -or $wifi.ToLower() -eq ""){
            
            enable-NetAdapter *wi-fi* -Confirm:0 | Out-Null
            Write-Host Wi-Fi netadapter is enabled! -ForegroundColor Green
            Start-Sleep -Seconds 1
            Write-Host "Connect Using The Enabled Wi-Fi Netadapter Interface?" -ForegroundColor Green
            Write-Host "[Y] Yes  [N] No [S] Suspend (default is "Y"):" -ForegroundColor White -NoNewline
            $value = Read-Host
            if ($value.ToLower() -eq "yes" -or $value.ToLower() -eq "y" -or $value.ToLower() -eq ""){
                connecting2
                netsh wlan connect AIGS | Out-Null;
                Start-Sleep -Milliseconds 800
                if ((Get-NetAdapter wi-fi).Status -eq "Up"){
                    Write-Host Wi-Fi is connected! -ForegroundColor Green
                
                }
                else {
                    Write-Host Wi-Fi is powered Off! -ForegroundColor Red
                }
                
             }
            
            }
        else{
                Disable-NetAdapter *Wi-Fi* | Out-Null
                Write-Host Wi-Fi netadapter is Disabled! -ForegroundColor Red
                }
        # else{

        #     <# Action when this condition is true #>
        # }
        # elseif($wifi.ToLower() -eq "no" -or $wifi.ToLower() -eq "n"){
        #     Disable-NetAdapter *wifinet* -Confirm:0
        #     Write-Host Ethernet interface is disabled!!! -ForegroundColor Red
        # }
        # elseif ($value.ToLower() -eq "s") {
        #     Write-Host Disconnection suspended.`nWi-Fi remains connected. -ForegroundColor Green 
        # }
    }
    elseif ((Get-NetIPInterface -InterfaceAlias "Wi-Fi" -ErrorAction SilentlyContinue) -and ((Get-NetAdapter Wi-fi -ErrorAction SilentlyContinue).Status -ne "Up")) {
        #Disable-NetAdapter *Ethernet* -Confirm:0
        Restart-Netadapter Wi-Fi -ErrorAction SilentlyContinue -Confirm:0; 
        netsh wlan connect AIGS | Out-Null;
            
        # Write-Host Connecting...  -ForegroundColor Green
        connecting2
        if  ((Get-NetAdapter Wi-Fi -ErrorAction SilentlyContinue).Status -eq "Up"){
            Write-Host Wi-Fi Connected! -ForegroundColor Green
            Write-Host Save browsing -ForegroundColor Cyan 
            }
        elseif ((Get-NetAdapter Wi-Fi -ErrorAction SilentlyContinue).Status -eq "disconnected") {
            Write-Host Wi-Fi is Powered Off! -ForegroundColor Red
        }        
        
    }   
    
    
    }
        
     
    
    # else {
    #     Write-Host Wi-Fi is disconnect!!! -ForegroundColor Green
    # }
    
Enable-NetAdapter -Name Wi-Fi
Disable-NetAdapter *ethernet*

Set-Alias -Name connect -Value connect_wifi 
Export-ModuleMember -Function "connect_wifi" -Alias *



















# Enable-NetAdapter Wi-Fi -Confirm:0 -ErrorAction SilentlyContinue
# Import-Module Connecting2
# Import-Module disconnect
# Disable-NetAdapter -name *Ethernet* -Confirm:0

# function connect_wifi{
    
#     if ((Get-NetAdapter wi-fi ).Status -eq "Disabled" -or (Get-NetIPInterface -interfaceAlias "wi-fi" | Out-Null).ConnectionState -eq "") {
#         # Write-Host "Wi-Fi is Disabled!!!`nDo you want to enable wi-fi Netadapter?" -ForegroundColor 
#         Write-Host "Wi-Fi Netadapter is Disabled!!!" -ForegroundColor red
#         Write-Host "Do you want to enable wi-fi Netadapter?" -ForegroundColor Green
#         Write-Host "[Y] Yes  [N] No [S] Suspend (default is "Y"):" -ForegroundColor White
#          $value = Read-Host
#          Start-Sleep -Seconds 1
#          Clear-Host
#          if ($value -eq "yes" -or $value.ToLower() -eq "y" -or $value.ToLower() -eq ""){
#             Enable-NetAdapter Wi-Fi | Out-Null
#             # Restart-Netadapter Wi-Fi -ErrorAction SilentlyContinue -Confirm:0 | Out-Null; 
            
            
#             # start-sleep -Milliseconds 800
#             if ((Get-NetAdapter wi-Fi).Status -eq "Disconnected"){
#                 Write-Host Wi-Fi NetAdapter Enabled.`nTrying To Connect Wi-Fi Network. -ForegroundColor Green
#                 Start-Sleep -Seconds 2
#                 netsh wlan connect AIGS | Out-Null
#                 connecting2  | Out-Null
#                 if ((Get-NetAdapter -Name wi-fi).Status -eq "up"){
#                 Write-Host Wi-Fi Connected!!! -ForegroundColor Green
#                 }
        
                
#             }
            
#         }
#          else {
#             Write-Host "Wi-Fi Netadapter is disabled" -ForegroundColor Red
            

#          }
#     }
#     elseif ((Get-NetAdapter Wi-fi -ErrorAction SilentlyContinue).Status -eq "Up") {
#         # Disable-NetAdapter *Ethernet* -Confirm:0
#         Write-Host "Wi-Fi is already Connected!!!`nSafe Browsing!!!" -ForegroundColor Green
#         Write-Host "Do you want to disconnect wi-fi?" -ForegroundColor red
#         Write-Host "[Y] Yes  [N] No [S] Suspend (default is "Y"):" -ForegroundColor White
#         $value = Read-Host
#         if ($value -eq "yes" -or $value.ToLower() -eq "y" -or $value.ToLower() -eq ""){
#             disconnect
            
            
#         }
#         elseif($value.ToLower() -eq "no" -or $value.ToLower() -eq "n"){
#             Write-Host Wi-Fi is still connected!!! -ForegroundColor Green
            
#         }
#         elseif ($value.ToLower() -eq "s") {
#             Write-Host Disconnection suspended.`nWi-Fi remains connected. -ForegroundColor Green 
            
#         }

#     }
    

#     elseif (!(Get-NetIPInterface -InterfaceAlias "Wi-Fi" -ErrorAction SilentlyContinue)) {
#         # Disable-NetAdapter *Ethernet* -Confirm:0
#         Write-Host "Wi-Fi netadapter is NOT enabled!!!`nReconnect the Modem." -ForegroundColor Red -ErrorAction SilentlyContinue
#         Write-Host "Do you want to use the ethernet interface?"
#         $etherInt = Read-Host
#         if ($etherInt.ToLower() -eq "yes" -or $etherInt.ToLower() -eq "y" -or $etherInt.ToLower() -eq ""){
            
#             enable-NetAdapter *Ethernet* -Confirm:0
#             Write-Host Ethernet interface is enabled! -ForegroundColor Green
#             Write-Host Power on and connect the modem with USB cord! -ForegroundColor Cyan
            

#         }
#         elseif($etherInt.ToLower() -eq "no" -or $etherInt.ToLower() -eq "n"){
#             Disable-NetAdapter *Ethernet* -Confirm:0
#             Write-Host Ethernet interface is disabled!!! -ForegroundColor Red
            
#         }
        
#     }
#     elseif ((Get-NetAdapter wi-fi ).Status -eq "disconnected") {
#         # write-host Wi-Fi is Disconnected -ForegroundColor Red
#         #Disable-NetAdapter *Ethernet* -Confirm:0
#         Restart-Netadapter Wi-Fi -ErrorAction SilentlyContinue -Confirm:0; 
#         netsh wlan connect AIGS | Out-Null;
#         # start-sleep -Seconds 1 
#         # connecting2 
#         # Write-Host Connecting...  -ForegroundColor Green
        
#     if ((Get-NetAdapter -Name wi-fi).Status -eq "up"){
#         Write-Host Wi-Fi Connected!!! -ForegroundColor Green
#         Write-Host Save browsing -ForegroundColor Cyan 
        


#     }
#     else {
#         Write-Host "Modem is Powered Off" -ForegroundColor Red
        
#     }
# }
    
# }

# # }
# Set-Alias -Name connect -Value connect_wifi 

# Export-ModuleMember -Function "connect_wifi" -Alias *































