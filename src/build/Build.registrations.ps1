########################################################
##
## Build.registrations.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Registrations for build tasks 
##
#######################################################

$mvntasks = "$PSScriptRoot/Maven.tasks.ps1"

# Registrations for imperative tasks
Register-ImperativeInclude -CallFile $mvntasks -Component

# Registrations for declarative tasks
Register-DeclarativeTask -Task Clean -Variable Build -Value maven -CallFile $mvntasks -CallTask MavenClean -Component
Register-DeclarativeTask -Task Build -Variable Build -Value maven -CallFile $mvntasks -CallTask MavenBuild -Component
Register-DeclarativeTask -Task Rebuild -Variable Build -Value maven -CallFile $mvntasks -CallTask MavenRebuild -Component
