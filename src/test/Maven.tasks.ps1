########################################################
##
## Naven.tasks.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Java test tasks
##
#######################################################

# Set correct path when invoked from other scripts
$BuildRoot = $BuildPath

# Synopsis: Tests Maven project
task MavenTest {
    Invoke-MavenTest -Path .
}
