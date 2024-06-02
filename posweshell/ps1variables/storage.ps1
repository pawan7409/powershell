# Take backup of Log Files C:/logs/ to Azure Storage Account in a Container in a folder with todays date
$connection_string = "DefaultEndpointsProtocol=https;AccountName=havenstorage12;AccountKey=V13N64pOy3JXzRfsIttjurLr8xB8ESvri91A6cIB26Qlw5xZZTE7b/m5Lyf6UX7JRNXIIKbVz2ZC+AStFgWcgw==;EndpointSuffix=core.windows.net"

$storage_account_name = "havenstorage12"
$container_name = "vinaycontainer" 

$date = Get-Date -Format "dd/MM/yyyy"
Write-Host "The Today's Date is $date"

$files = Get-ChildItem -Path E:\personal

Write-Host "------------------------------------------"
Write-Host "The Type of files variable is:"
$files.GetType()
Write-Host "------------------------------------------"

foreach ( $file in $files ) {

    Write-Host "------------------------------------------"
    Write-Host "Uploading file $file..." 

    az storage blob upload --account-name $storage_account_name --container-name $container_name --name "$date/$file" --file "E:\personal\$file" --connection-string $connection_string 
    
    Write-Host "File uploaded Successfully - $file..."
    Write-Host "------------------------------------------"
}
