# SAM_Deploy

This is the managed release repostiry for SAM.

[![Build Status](https://hldigitalinnovation.visualstudio.com/HLApps/_apis/build/status/SAM-deploy-All%20in%20One?branchName=master)](https://hldigitalinnovation.visualstudio.com/HLApps/_build/latest?definitionId=21&branchName=master)

Each repository is included as a submodule which means they only point to a set commit with detached head, see 

https://git-scm.com/book/en/v2/Git-Tools-Submodules

https://blog.tech-fellow.net/2019/05/09/effectively-work-with-git-submodules/

To clone with all submodules inncluded do:

git clone --recurse-submodules https://github.com/HoareLea/SAM_Deploy.git

or, if you've already cloned it:

git submodule update --init --recursive


TODO:
- [x] Get build server to build it
- [ ] Create installer
- [ ] Support synamtic versioning
- [ ] Include releases of installer.zip and sourcecode.zip
- [ ] Tidy up this readme
- [ ] Make repo public
