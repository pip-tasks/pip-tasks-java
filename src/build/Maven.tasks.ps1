########################################################
##
## Maven.tasks.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Common build tasks
##
#######################################################

# Set correct path when invoked from other scripts
$BuildRoot = $BuildPath

# Synopsis: Clears Maven project
task MavenClean {
    Clear-MavenBuild -Path .
}

# Synopsis: Builds Maven project
task MavenBuild {
    Invoke-MavenBuild -Path .
}

# Synopsis: Rebuilds Maven project
task MavenRebuild {
    Invoke-MavenRebuild -Path .
}
