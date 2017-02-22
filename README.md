# <img src="https://github.com/pip-tasks/pip-tasks/raw/master/artifacts/logo.png" alt="Pip.Devs Logo" style="max-width:30%"> <br/> Java build tasks for Pip.Tasks

This Powershell module contains tasks for [Pip.Tasks](https://github.com/pip-tasks/pip-tasks) to build Java components

### Maven package management, built and test tasks

Maven project configuration is defined by **pom.xml** file in the root folder of the component.

Maven tasks:
* **GetVersion** - gets version of Maven project
* **SetVersion** - sets version of Maven project
  - **Version** - version parameter
* **GetDep** - gets Maven dependencies
* **InstallDep** - downloads Maven dependencies 
* **UpdateDep** - updates Maven dependency to specified version
  - **Dependency** - dependency name parameter
  - **Version** - dependency version parameter
* **CleanDep** - cleans Maven dependencies
* **Clean** - cleans Maven project (mvn clean)
* **Build** - builds Maven project (mvn build)
* **Rebuild** - rebuilds Maven project (mvn clean; mvn build)
* **Test** - runs tests from Maven project (mvn test)

Maven configuration variables:
* **Package** - Turns on Maven package management tasks (must be 'maven')
* **Build** - Turns on Maven build tasks (must be 'maven')
* **Test** - Turns on Maven test tasks (must be 'maven')

## Installation

* Checkout **pip-tasks** and **pip-tasks-java** modules
* Add folder with the modules to **PSModulePath**
* Import **pip-tasks-java** module. **pip-tasks** will be imported automatically

## Usage

Let's say you have a Node.js component, implemented in Typescript and tested with Mocha.

The file structure may look the following:
```bash
/workspace
  ...
  /component1
    /lib
    /obj
    /src
    /test
    component.conf.ps1
    pom.xml
```

**component.conf.ps1** file:
```powershell
$VersionControl = 'git'
$Package = 'maven'
$Build = 'maven'
$Document = 'none'
$Test = 'maven'
$Deploy = 'none'
$Run = 'none'
```

A typical scenario to work with this component may include the following steps:

* Pull changes from Git repository
```powershell
> Invoke-Task -Task Pull -Component component1
```

* Install Maven dependencies
```powershell
> Invoke-Task -Task InstallDep -Component component1
```

* Compile component with Maven (Java)
```powershell
> Invoke-Task -Task Rebuild -Component component1
```

* Test component with Maven (Junit)
```powershell
> Invoke-Task -Task Test -Component component1
```

* Change version of external dependency
```powershell
> Invoke-Task -Task UpdateDep -Dependency component2 -Version 1.2.0 -Component component1
```

* Set new version for the component and push changes to Git repository
```powershell
> Invoke-Task -Task SetVersion -Version 1.0.1 -Component component1
> Invoke-Task -Task Push -Message "My changes" -Component component1
```

* Set tag to Git repository and publish public release
```powershell
> Invoke-Task -Task SetTag v1.0.1 -Component component1
> Invoke-Task -Task Publish -Component component1
```

Instead of typing full Powershell command 
```powershell
> Invoke-Task -Task getchanges -Component component1
```
you can use shortcuts like:
```powershell
> piptask getchanges
```

For more information about **Pip.Tasks** build infrastructure read documentation 
from the master project [here...](https://github.com/pip-tasks/pip-tasks)
## Acknowledgements

This module created and maintained by **Sergey Seroukhov**.
