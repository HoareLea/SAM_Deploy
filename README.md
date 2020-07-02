# SAM_Deploy

This is the managed release repostiry for SAM.

Each repository is included as a submidule which means they only point to a set commit with detached head, see 

https://git-scm.com/book/en/v2/Git-Tools-Submodules.
https://blog.tech-fellow.net/2019/05/09/effectively-work-with-git-submodules/

To upate all submodules to latest do:

git submodule update --init --recursive


TODO:
- [ ] Get build server to build it
- [ ] Create installer
- [ ] Support synamtic versioning
- [ ] Include releases of installer.zip and sourcecode.zip
- [ ] Tidy up this readme
- [ ] Make repo public
