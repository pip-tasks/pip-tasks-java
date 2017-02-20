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

# Synopsis: Clears nuget dependencies
task MavenCleanDep {
    Clear-MavenDependencies -Path .
}

# Synopsis: Restore nuget dependencies
task MavenRestoreDep {
    Restore-MavenDependencies -Path .
}

# Synopsis: Update nuget dependency
task MavenUpdateDep {
    Update-MavenDependency -Path . -Dependency $Dependency -Version $Version
}
