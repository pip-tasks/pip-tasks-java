########################################################
##
## Maven.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Maven commands
##
#######################################################

function Install-Maven
{
<#
.SYNOPSIS

Installs Maven project into the local repository

.DESCRIPTION

Install-Maven builds, tests and installs Maven project into the local repository

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Install-Maven -Path .

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
                & mvn clean install 2>&1
            } "Install project with Maven failed"
        }
    }
    end {}
}


function Clear-MavenDependencies
{
<#
.SYNOPSIS

Clears Maven dependencies

.DESCRIPTION

Clear-MavenDependencies removed dependencies folder with npm dependencies

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Clear-MavenDependencies -Path .

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
                & mvn dependency:purge-local-repository
            } "Failed to clear Maven dependencies"
        }
    }
    end {}
}

function Restore-MavenDependencies
{
<#
.SYNOPSIS

Installs Maven dependencies

.DESCRIPTION

Restore-MavenDependencies installs Maven dependencies

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Restore-MavenDependencies -Path .

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
                & mvn initialize
            } "Failed to install Maven dependencies"
        }
    }
    end {}
}


function Update-MavenDependency
{
<#
.SYNOPSIS

Updates version of Maven dependency

.DESCRIPTION

Update-MavenDependency updates version of Maven dependency specified by name

.PARAMETER Path

Path to Maven project (default: .)

.PARAMETER Dependency

Dependency name

.PARAMETER Version

Dependency version

.EXAMPLE

PS> Update-MavenDependency -Path . -Dependency pip-services-commons -Version 1.0.*

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.',
        [Parameter(Mandatory=$false, Position=1, ValueFromPipelineByPropertyName=$true)]
        [string] $Dependency,
        [Parameter(Mandatory=$false, Position=2, ValueFromPipelineByPropertyName=$true)]
        [string] $Version
    )
    begin {}
    process 
    {
        if ($Dependency -eq $null -or $Dependency -eq '') { return }
        if ($Dependency.Contains('@'))
        {
            $pos = $Dependency.IndexOf('@')
            $Dependency = $Dependency.Substring(0, $pos)
            $Version = $Dependency.Substring($pos + 1)
        }

        # Todo: Complete this implementation later
    }
    end {}
}
