########################################################
##
## Maven.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Maven commands
##
#######################################################

function Invoke-MavenTest
{
<#
.SYNOPSIS

Runs Maven to test project

.DESCRIPTION

Invoke-Maven executes Maven projects tests

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Invoke-MavenTest -Path .

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.'
    )
    begin {}
    process 
    {
        Invoke-At $Path {
            Invoke-External { 
                & mvn test 2>&1
            } "Running Maven failed"
        }
    }
    end {}
}
