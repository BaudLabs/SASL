########################################################################################
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
# OR OTHER DEALINGS IN THE SOFTWARE.
########################################################################################
# SysAdmin's Scripts Library @ https://github.com/BaudLabs/SASL
########################################################################################
# Azure Resource Manager (ARM) -- Add unmanaged data disk to a virtual machine.
########################################################################################
# Define variables:
########################################################################################

$location = "INSERT_LOCATION"
$vmResourceGroupName = "INSERT_RESOURCE_GROUP_NAME"
$vmName = "INSERT_VM_NAME"
$storageAccountResourceGroupName = "INSERT_RESOURCE_GROUP_NAME"
$storageAccountName = "INSERT_STORAGE_ACCOUNT_NAME"
$dataDiskName = $vmName + ".DataDisk02"
$dataDiskSize = 1023 # Size in GB.
$hostCachePreference = "ReadOnly" # Values: ReadOnly, ReadWrite, None.
$lun = 03

########################################################################################
# Script execution:
########################################################################################

## Select storage account.
$storageAccount = Get-AzureRmStorageAccount `
    -ResourceGroupName $storageAccountResourceGroupName `
    -Name $storageAccountName

## Define VHD URI path.
$vhdURI = $storageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/" + $dataDiskName  + ".vhd"

## Select virtual machine.
$virtualMachine = Get-AzureRmVM `
    -Name $vmName `
    -ResourceGroupName $vmResourceGroupName

## Add additional data disk to the virtual machine.
Add-AzureRmVMDataDisk `
    -VM $virtualMachine `
    -Name $dataDiskName `
    -VhdUri $vhdURI `
    -Caching $hostCachePreference `
    -DiskSizeInGB $dataDiskSize `
    -Lun $lun `
    -CreateOption Empty

## Update virtual machine to finish.
Update-AzureRmVM `
    -VM $virtualMachine `
    -ResourceGroupName $vmResourceGroupName

########################################################################################
# The End.
########################################################################################