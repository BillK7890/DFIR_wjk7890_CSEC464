#Get time
Write-Output "Time: "
Get-TimeZone | Select DisplayName
#Get scheduled tasks
Write-Output "Scheduled Tasks: "
Get-ScheduledTask
#get users
Write-Output "Get Users: "
Get-WmiObject -Class Win32_UserAccount
$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$adsi.Children | where {$_.SchemaClassName -eq 'user'} | ft name,lastlogin
Get-EventLog System -Source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-5) -ComputerName $env:computername

####
Get-Date -DisplayHint Time

####
Write-Output "Up Time: "
function Get-Uptime {
   $os = Get-WmiObject win32_operatingsystem
   $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
   $Display = "Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes" 
   Write-Output $Display
}


####
Write-Output "OS Version: "
[System.Environment]::OSVersion.Version


####
Write-Output "Hostname: "
(Get-WMIObject win32_operatingsystem).name

####
Write-Output "Manufacturer: "
Get-WmiObject Win32_Processor | Select Manufacturer, Name

###
Write-Output "Memory Space: "
Get-WmiObject CIM_PhysicalMemory | Measure-Object -Property capacity -sum | % {[math]::round(($_.sum / 1GB),2)} 


###
Write-Output "HDD Space: "
get-wmiobject Win32_LogicalDisk -Filter "DriveType = 3"


###
Write-Output "Installed Programs: "
Get-WmiObject -Class Win32_Product | Select Name


###
Write-Output "Services at boot: "
Get-WmiObject win32_service -Filter "StartMode = 'Auto'" | Select Name, DisplayName, Startmode 

###
Write-Output "Users: "
$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$adsi.Children | where {$_.SchemaClassName -eq 'user'} | ft name,lastlogin


###
Write-Output "Shares, shared printers, wifi profiles: "
get-WmiObject -class Win32_Share
Get-WmiObject -class Win32_Printer | Where-Object {$_.shared}
netsh wlan show profile

###
Write-Output "Drivers: "
Get-WmiObject -Class Win32_Product

###
Write-Output "Processes: "
Get-Process

