# Azure Storage Blob Sample - Demonstrate how to use the Blob Storage service.
# Blob storage stores unstructured data such as text, binary data, documents or media files.
# Blobs can be accessed from anywhere in the world via HTTP or HTTPS.

# Set the name of selected subscription.
# To Retrieve the name of your subscription, open a separate Azure PowerShell window and run the following two lines:
	# Add-AzureAccount
	# Get-AzureSubscription | Format-Table SubscriptionName, IsDefault, IsCurrent, CurrentStorageAccountName
$SubscriptionName="Your Subscription Name"

# Provide the name of your Storage account.
$StorageAccountName="Your Account Name"

# Provide a name for your new container.
$ContainerName = "Container Name"

# Provide a name for your new blob
$BlobName = "Blob Name"

# Provide the full path to a file you want to upload.
$FileToUpload = "C:\full\path\to\file.jpg"

# Provide the full path to a directory you wish to use for downloaded blobs.
$DestinationFolder = "C:\DownloadedBlobs"

# Add your Azure account to the local PowerShell environment.
Add-AzureAccount

# Set default Azure subscription.
Select-AzureSubscription -SubscriptionName $SubscriptionName –Default

# Set default Storage account.
Set-AzureSubscription -CurrentStorageAccountName $StorageAccountName -SubscriptionName $SubscriptionName

# 1. Create a new container.
New-AzureStorageContainer -Name $ContainerName -Permission Off

# 2. Upload a blob into a container.
Set-AzureStorageBlobContent -Container $ContainerName -File $FileToUpload -Blob $BlobName

# 3. List all blobs in a container.
Get-AzureStorageBlob -Container $ContainerName

# 4. Download blobs from the container:

# Get reference to a blob
$blob = Get-AzureStorageBlob -Container $ContainerName -Blob $BlobName

# Create the destination directory.
New-Item -Path $DestinationFolder -ItemType Directory -Force

# Download blob into local destination directory.
$blob | Get-AzureStorageBlobContent –Destination $DestinationFolder

# 5. Create snapshot of blob
$snap = $blob.ICloudBlob.CreateSnapshot()

# 6. List blob snapshots
Get-AzureStorageBlob -Container $ContainerName | Where-Object { $_.ICloudBlob.IsSnapshot -and $_.Name -eq $BlobName }

# 7. Delete blob
# Remove-AzureStorageBlob -Blob $BlobName -Container $ContainerName
