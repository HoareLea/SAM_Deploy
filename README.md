<h1>SAM_Deploy</h1>

This is the managed release repository for SAM.

[![Build Status](https://hldigitalinnovation.visualstudio.com/HLApps/_apis/build/status/SAM-deploy-All%20in%20One?branchName=master)](https://hldigitalinnovation.visualstudio.com/HLApps/_build/latest?definitionId=21&branchName=master)

[![Release Status](https://hldigitalinnovation.vsrm.visualstudio.com/_apis/public/Release/badge/a6367bee-24cb-4be6-a95d-64f2645fdd2d/12/18)](https://hldigitalinnovation.vsrm.visualstudio.com/_apis/public/Release/badge/a6367bee-24cb-4be6-a95d-64f2645fdd2d/12/18)

<h2>Installing</h2>

Dowload latest release here:

https://github.com/HoareLea/SAM_Deploy/releases/latest/download/SAM_Install.exe



<h2>Debugging or building it yourself</h2>

Each repository is included as a submodule which means they only point to a set commit with detached head, see 

https://git-scm.com/book/en/v2/Git-Tools-Submodules

https://blog.tech-fellow.net/2019/05/09/effectively-work-with-git-submodules/

To clone with all submodules included do:

git clone --recurse-submodules https://github.com/HoareLea/SAM_Deploy.git

or, if you've already cloned it:

git submodule update --init --recursive


TODO:
- [x] Get build server to build it
- [x] Create installer
- [ ] Support synamtic versioning
- [x] Include releases of installer.zip and sourcecode.zip
- [ ] Tidy up this readme
- [ ] Make repo public
