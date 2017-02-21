########################################################
##
## Package.registrations.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Registrations for package management tasks 
##
#######################################################

$mvntasks= "$PSScriptRoot/Maven.tasks.ps1"

# Registrations for imperative tasks
Register-ImperativeInclude -CallFile $mvntasks -Component

# Registrations for declarative tasks
Register-DeclarativeTask -Task Install -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenInstall -Component
Register-DeclarativeTask -Task GetVersion -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenGetVersion -Component
Register-DeclarativeTask -Task SetVersion -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenSetVersion -Component
Register-DeclarativeTask -Task GetDep -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenGetDep -Component
Register-DeclarativeTask -Task CleanDep -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenCleanDep -Component
Register-DeclarativeTask -Task RestoreDep -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenRestoreDep -Component
Register-DeclarativeTask -Task UpdateDep -Variable Package -Value maven -CallFile $mvntasks -CallTask MavenUpdateDep -Component
