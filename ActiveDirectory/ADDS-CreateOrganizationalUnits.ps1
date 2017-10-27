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
# Active Directory Domain Services (ADDS) -- Create new Organizational Units (OU)
########################################################################################
# Define variables below.
########################################################################################

$ous = `
"INSERT_OU_NAME",`
"INSERT_OU_NAME",`
"INSERT_OU_NAME",`
"INSERT_OU_NAME"

########################################################################################
# Execute code below.
########################################################################################

ForEach ($ou in $ous) {
    New-ADOrganizationalUnit -Name $ou
}