# <img src="https://github.com/pip-tasks/pip-tasks-ps/raw/master/artifacts/logo.png" alt="Pip.Devs Logo" style="max-width:30%"> <br/> Java build tasks for Pip.Tasks

This Powershell module brings tasks for Pip.Tasks to build Java components

**Maven** tasks turned on by property **$Package = 'maven'**, **$Build = 'maven'** and **$Test = 'maven'**
* **GetVersion** - gets version of Maven project
* **SetVersion** - sets version of Maven project
* **GetDep** - gets Maven dependencies
* **CleanDep** - cleans Maven dependencies
* **RestoreDep** - downloads Maven dependencies 
* **UpdateDep** - updates Maven dependency to specified version
* **Clean** - cleans Maven project (mvn clean)
* **Build** - builds Maven project (mvn build)
* **Rebuild** - rebuilds Maven project (mvn clean; mvn build)
* **Test** - runs tests from Maven project (mvn test)

## Installation

* Checkout **pip-tasks-ps** and **pip-tasks-java-ps** modules
* Add folder with the modules to **PSModulePath**
* Import **pip-tasks-java-ps** module. **pip-tasks-ps** will be imported automatically

## Usage

TBD...

## Acknowledgements

This module created and maintained by **Sergey Seroukhov**.
