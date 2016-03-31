# Azure Queue Service Sample - The Queue Service provides reliable messaging for workflow processing and for communication
# between loosely coupled components of cloud services. This sample demonstrates how to perform common tasks including
# creating, listing, and deleting queues.

# Set the name of selected subscription.
$SubscriptionName="Subscription Name"

# Provide the name of your resource group
$ResourceGroupName="Resource Group Name"

# Provide the name of your Storage account.
$StorageAccountName="Storage Account Name"

# Provide a name for your new table.
$QueueName = "Queue Name"

# Add your Azure account to the local PowerShell environment.
Add-AzureRMAccount

# Set default Azure subscription.
Get-AzureRmSubscription -SubscriptionName $SubscriptionName | Select-AzureRmSubscription

# Set default Storage account.
Set-AzureRmCurrentStorageAccount -ResourceGroupName $ResourceGroupName -StorageAccountName $StorageAccountName

# 1. Create a new queue.
New-AzureStorageQueue -Name $QueueName

# 2. List all queues.
Get-AzureStorageQueue

# 3. Remove queue
# Remove-AzureStorageQueue $QueueName
