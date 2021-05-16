Connect-SPOService -Url "https://ENTER_DOMAIN_NAME-admin.sharepoint.com"
$Title = "SharePoint Online Tasks"
$Info = "Pick Something!"
$options = echo "Enable External Sharing","Disable External Sharing","Enable Custom Scripting","Disable Custom SCripting","Increase Quota","Return to Main Menu","QUIT"
$defaultchoice = 1
$selected =  $host.UI.PromptForChoice($Title , $Info , $Options, $defaultchoice)
##$options[$selected]
##$siteURL="https://ENTER_DOMAIN_NAME.sharepoint.com/sites/TestSite"
$siteURL=Read-Host "Enter Site URL:"

if($selected -eq 0)
{

Set-SPOSite -Identity $siteURL -SharingCapability ExternalUserSharingOnly
Get-SPOSite -Identity $siteURL| Select Url,SharingCapability

}

elseif($selected -eq 1)
{
Set-SPOSite -Identity $siteURL -SharingCapability Disabled
Get-SPOSite -Identity $siteURL| Select Url,SharingCapability

}

elseif($selected -eq 2)
{

Set-SPOSite -Identity $siteURL -DenyAddAndCustomizePages 0 
Get-SPOSite -Identity $siteURL| Select Url,DenyAddAndCustomizePages
Write-Host "Custom Scripting Enabled"

}
elseif($selected -eq 3)
{

Set-SPOSite -Identity $siteURL -DenyAddAndCustomizePages 1
Get-SPOSite -Identity $siteURL| Select Url,DenyAddAndCustomizePages
Write-Host "Custom Scripting Disabled"


}
elseif($selected -eq 4)
{

$QuotaIncrease = 1
 
$Site = Get-SPOSite -Identity $SiteURL -Detailed
 
#Calculate New Storage Quota
$CurrentStorage = $Site.StorageQuota
$NewStorage = $CurrentStorage + ($QuotaIncrease * 1024)
 
#Increase Storage Quota
Set-SPOSite -Identity $SiteURL -StorageQuota $NewStorage
Write-Host "Storage Quota set from '$CurrentStorage' to '$NewStorage'"

}
elseif($selected -eq 5)
{
$selected =  $host.UI.PromptForChoice($Title , $Info , $Options, $defaultchoice)
}

elseif($selected -eq 6)
{
Return;
}
    






