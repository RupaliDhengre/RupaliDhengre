## ******************BEGIN****************************
## Create one csv file with the column name: Email & replace below path with the exact path of your input csv file. 
##Enter exact path for the input csv file. 
$a=Import-csv "C:\Users\DG.csv"
ForEach($test in $a)
{

$DG=Get-DistributionGroup -identity $test.Email |Select PrimarysmtpAddress,DisplayName,GroupType
$Member=Get-DistributionGroupMember -identity $test.Email|Select PrimarysmtpAddress,CompanyName
    
	ForEach($Members in $Member)
	{
		$userObj = New-Object PSObject
		$userObj | Add-Member NoteProperty -Name "Display Name" -Value $DG.DisplayName
		$userObj | Add-Member NoteProperty -Name "Group Type" -Value $DG.GroupType
		$userObj | Add-Member NoteProperty -Name "DG Members" -Value $Members.PrimarysmtpAddress
		
##Below statement will print the data on the screen. 
Write-Output $Userobj

## If you want to export the output to the csv file then un-comment below statement and replace the export path. 
##$Userobj |Export-csv –Path “Enter path of the CSV file where you would like to export the data”


	}
} 

## ******************END****************************

