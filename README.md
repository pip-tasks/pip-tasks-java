# <img src="https://github.com/pip-tasks/pip-tasks-ps/raw/master/artifacts/logo.png" alt="Pip.Devs Logo" style="max-width:30%"> <br/> Java build tasks for Pip.Tasks

This Powershell module brings tasks for Pip.Tasks to build Java components

**Maven** tasks turned on by property **$Package = 'maven'**, **$Build = 'maven'** and **$Test = 'maven'**
* **CleanDep** - cleans packages with Maven dependencies
* **RestoreDep** - downloads Maven packages references by projects 
* **UpdateDep** - updates selected package or all packages from specified source to the latest compatible version
* **Clean** - cleans projects with Maven (mvn clean)
* **Build** - builds projects  with Gulp (mvn build)
* **Rebuild** - rebuilds projects with Maven (mvn clean; mvn build)
* **Test** - runs tests with Maven (mvn test)

## Installation

* Checkout **pip-tasks-ps** and **pip-tasks-java-ps** modules
* Add folder with the modules to **PSModulePath**
* Import **pip-tasks-java-ps** module. **pip-tasks-ps** will be imported automatically

## Usage

TBD...

## Acknowledgements

This module created and maintained by **Sergey Seroukhov**.
