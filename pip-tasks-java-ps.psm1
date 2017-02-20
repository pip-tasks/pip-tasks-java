########################################################
##
## pip-tasks-java-ps.psm1
## Pip.Tasks.Java - Java build tasks for Pip.Tasks
## Startup module
##
#######################################################

$path = $PSScriptRoot
if ($path -eq "") { $path = "." }

. "$path\src\package\Maven.ps1"
. "$path\src\build\Maven.ps1"
. "$path\src\test\Maven.ps1"

. "$path\src\package\Package.registrations.ps1"
. "$path\src\build\Build.registrations.ps1"
. "$path\src\test\Test.registrations.ps1"
