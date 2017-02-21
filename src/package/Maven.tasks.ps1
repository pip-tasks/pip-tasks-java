########################################################
##
## Maven.tasks.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Maven build tasks
##
#######################################################

# Set correct path when invoked from other scripts
$BuildRoot = $BuildPath

# Synopsis: Installs Maven project
task MavenInstall {
    Install-Maven -Path .
}

# Synopsis: Gets version of Maven project
task MavenGetVersion {
    Get-MavenVersion -Path .
}

# Synopsis: Sets version of Maven project
task MavenSetVersion {
    assert ($Version -ne $null) "Version is not set"

    Set-MavenVersion -Path . -Version $Version
}

# Synopsis: Gets Maven dependencies
task MavenGetDep {
    Get-MavenDependencies -Path .
}

# Synopsis: Clears Maven dependencies
task MavenCleanDep {
    Clear-MavenDependencies -Path .
}

# Synopsis: Restore Maven dependencies
task MavenRestoreDep {
    Restore-MavenDependencies -Path .
}

# Synopsis: Update Maven dependency
task MavenUpdateDep {
    assert ($Dependency -ne $null) "Dependency is not set"
    assert ($Version -ne $null) "Version is not set"

    Update-MavenDependency -Path . -Dependency $Dependency -Version $Version
}
