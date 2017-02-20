########################################################
##
## Maven.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Maven commands
##
#######################################################


function Clear-MavenBuild
{
<#
.SYNOPSIS

Clears Maven project

.DESCRIPTION

Clear-MavenBuild clears Maven project build

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Clear-MavenBuild -Path .

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
                & mvn clean 2>&1
            } "Cleaning Maven build failed"
        }
    }
    end {}
}


function Invoke-MavenBuild
{
<#
.SYNOPSIS

Builds Maven project

.DESCRIPTION

Invoke-Maven builds Maven project in specified configuration

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Invoke-MavenBuild -Path .

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
                & mvn compile 2>&1
            } "Build with Maven failed"
        }
    }
    end {}
}


function Invoke-MavenRebuild
{
<#
.SYNOPSIS

Rebuilds Maven project

.DESCRIPTION

Invoke-Maven rebuilds Maven project in specified configuration

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Invoke-MavenRebuild -Path .

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
                & mvn clean compile 2>&1
            } "Build project with Maven failed"
        }
    }
    end {}
}
