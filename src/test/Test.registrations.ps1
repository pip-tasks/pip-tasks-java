########################################################
##
## Test.registrations.ps1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Registrations for test tasks 
##
#######################################################

$mvntasks = "$PSScriptRoot/Maven.tasks.ps1"

# Registrations for imperative tasks
Register-ImperativeInclude -CallFile $mvntasks -Component

# Registrations for declarative tasks
Register-DeclarativeTask -Task Test -Variable Test -Value maven -CallFile $mvntasks -CallTask MavenTest -Component
