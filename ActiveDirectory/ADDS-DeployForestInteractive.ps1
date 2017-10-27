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
# Active Directory Domain Services (ADDS) -- Deploy new AD forest (interactive)
########################################################################################
# Define variables below.
########################################################################################

$domainName = "contoso.com"
## Specifies the fully qualified domain name (FQDN) for the root (first) domain in the forest.

$domainNetbiosName = "CONTOSO"
## Specifies the NetBIOS name for the root domain in the new forest. For NetBIOS names to be
## valid for use with this parameter they must be single label names of 15 characters or less.

$domainMode = "Win2008"
## Specifies the domain functional level of the first domain in the creation of a new forest.
## Supported values for this parameter can be either a valid integer or a corresponding
## enumerated string value.
## -- Windows Server 2003: 2 or Win2003
## -- Windows Server 2008: 3 or Win2008
## -- Windows Server 2008 R2: 4 or Win2008R2
## -- Windows Server 2012: 5 or Win2012
## -- Windows Server 2012 R2: 6 or Win2012R2

$forestMode = "Win2008"
## Specifies the forest functional level for the new forest. Supported values for this
## parameter can be either a valid integer or a corresponding enumerated string value.
## -- Windows Server 2003: 2 or Win2003
## -- Windows Server 2008: 3 or Win2008
## -- Windows Server 2008 R2: 4 or Win2008R2
## -- Windows Server 2012: 5 or Win2012
## -- Windows Server 2012 R2: 6 or Win2012R2

$databasePath = "C:\Windows\NTDS"
## Specifies the fully qualified, non-Universal Naming Convention (UNC) path to a directory
## on a fixed disk of the local computer that contains the domain database,
## for example, C:\Databases\NTDS. The default is %SYSTEMROOT%\NTDS.

$logPath = "C:\Windows\NTDS"
## Specifies the fully qualified, non-UNC path to a directory on a fixed disk of the local
## computer where the log file for this operation will be written. For example, C:\Logs.
## The default log file path if no other path is specified with this parameter is %SYSTEMROOT%\NTDS.

$sysvolPath = "C:\Windows\SYSVOL"
## Specifies the fully qualified, non-UNC path to a directory on a fixed disk of the local
## computer where the Sysvol file will be written. For example, C:\Logs\SYSVOL. The default
## path if no other path is specified with this parameter is %SYSTEMROOT%\SYSVOL.

########################################################################################
# Execute code below.
########################################################################################

Import-Module ServerManager

Install-WindowsFeature -name AD-Domain-Services –IncludeManagementTools

Import-Module ADDSDeployment

Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath $databasePath `
    -DomainMode $domainMode `
    -DomainName $domainName `
    -DomainNetbiosName $domainNetbiosName `
    -ForestMode $forestMode `
    -InstallDns:$true `
    -LogPath $logPath `
    -NoRebootOnCompletion:$false `
    -SysvolPath $sysvolPath `
    -Force:$true