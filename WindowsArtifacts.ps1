#Get time
Get-TimeZone | Select DisplayName
#Get scheduled tasks
Get-ScheduledTask
#get users
Get-WmiObject -Class Win32_UserAccount
$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$adsi.Children | where {$_.SchemaClassName -eq 'user'} | ft name,lastlogin
Get-EventLog System -Source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-5) -ComputerName $env:computername

####
Get-Date -DisplayHint Time

####
function Get-Uptime {
   $os = Get-WmiObject win32_operatingsystem
   $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
   $Display = "Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes" 
   Write-Output $Display
}


####
[System.Environment]::OSVersion.Version


####
(Get-WMIObject win32_operatingsystem).name

####
Get-WmiObject Win32_Processor | Select Manufacturer, Name

###
Get-WmiObject CIM_PhysicalMemory | Measure-Object -Property capacity -sum | % {[math]::round(($_.sum / 1GB),2)} 


###
get-wmiobject Win32_LogicalDisk -Filter "DriveType = 3"


###
Get-WmiObject -Class Win32_Product | Select Name


###
Get-WmiObject win32_service -Filter "StartMode = 'Auto'" | Select Name, DisplayName, Startmode 

###
$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$adsi.Children | where {$_.SchemaClassName -eq 'user'} | ft name,lastlogin


###
get-WmiObject -class Win32_Share
Get-WmiObject -class Win32_Printer | Where-Object {$_.shared}
netsh wlan show profile

###
Get-WmiObject -Class Win32_Product

###
Get-Process

