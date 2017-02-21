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


function Get-MavenVersion
{
<#
.SYNOPSIS

Gets version of Maven project

.DESCRIPTION

Get-MavenVersion gets version of Maven project

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Get-MavenVersion -Path .

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
            if (Test-Path -Path pom.xml)
            {
                [xml]$pom = Get-Content -Path pom.xml
                Write-Output $pom.project.version
            }
        }
    }
    end {}
}


function Set-MavenVersion
{
<#
.SYNOPSIS

Sets version of Maven project

.DESCRIPTION

Set-MavenVersion sets version of Maven project

.PARAMETER Path

Path to Maven project (default: .)

.PARAMETER Version

New version of the Maven project

.EXAMPLE

PS> Get-MavenVersion -Path .

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0, ValueFromPipelineByPropertyName=$true)]
        [string] $Path = '.',
        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [string] $Version
    )
    begin {}
    process 
    {
        Invoke-At $Path {
            if (Test-Path -Path pom.xml)
            {
                [xml]$pom = Get-Content -Path pom.xml
                $pom.project.version = $Version
                ConvertFrom-Xml -InputObject $pom | Set-Content -Path pom.xml
            }
        }
    }
    end {}
}


function Get-MavenDependencies
{
<#
.SYNOPSIS

Gets all Maven dependencies

.DESCRIPTION

Get-MavenDependencies gets all Maven dependencies and their versions

.PARAMETER Path

Path to Maven project (default: .)

.EXAMPLE

PS> Get-MavenDependencies -Path .

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
            if (Test-Path -Path pom.xml)
            {
                [xml]$pom = Get-Content -Path pom.xml

                $deps = @{}
                foreach ($d in $pom.project.dependencies.dependency)
                {
                    $dep = $d.groupId + ':' + $d.artifactId + '@' + $d.version
                    $deps[$dep] = $dep
                }
                $deps.Keys | Sort-Object | Write-Output
            }
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
        [Parameter(Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
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

        $Group = ''
        if ($Dependency.Contains(':'))
        {
            $pos = $Dependency.IndexOf(':')
            $Group = $Dependency.Substring(0, $pos)
            $Dependency = $Dependency.Substring($pos + 1)
        }

        Invoke-At $Path {
            if (Test-Path -Path pom.xml)
            {
                [xml]$pom = Get-Content -Path pom.xml

                $updated = $false
                foreach ($d in $pom.project.dependencies.dependency)
                {
                    if ($Group -ne '' -and -not $d.groupId.Contains($Group))
                    {
                        continue
                    }

                    if ($Dependency -ne '' -and -not $d.artifactId.Contains($Dependency))
                    {
                        continue
                    }

                    Write-Host "Updated $($d.groupId):$($d.artifactId) to version $Version"
                    $d.version = $Version
                    $updated = $true
                }

                if ($updated)
                {
                    ConvertFrom-Xml -InputObject $pom | Set-Content -Path pom.xml
                }
            }
        }
    }
    end {}
}
