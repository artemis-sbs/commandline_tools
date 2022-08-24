# commandline_tools
Command line batch files etc. for managing Artemis Cosmos missions

This is a simple way to install "DLC" provided the DLC is stored on github


Place these file in the data\missions directory

## Fetch.bat
Used to fetch Missions that are on github

Place this file in the data\missions directory

FETCH github-user github-repository [rename] [github-branch or tag]

- github user is the user or organization that host the repository (e.g. artemis-sbs)
- github-repository is the name of the mission (e.g. CruiserTournament)
- rename optional rename the mission directory
- github-branch optional defaults to main/master 
    - a branch is a snapshot of a version of the mission

### Examples
Run from the command line in the data\missions folder

Install the Cruiser Tournament Mission Script

``` cmd
.\fetch artemis-sbs CruiserTournament
```

Copy the sbs-example mission and rename it. This is a good way to install a starter boilerplate template

``` cmd
.\fetch artemis-sbs sbs_example my-new-mission
```

Install the Cruiser Tournament Mission Script using the branch beta-v2

``` cmd
.\fetch artemis-sbs CruiserTournament CruiserTournament beta-v2
```



## pip_install.bat
This used to install and dependencies.

Dependencies are listed in requirements.txt in the folder for you mission. e.g. data\missions\sbs_example\requirements.txt


Place this file in the data\missions directory

pip_install.bat is called by fetch. or needs to be called manually if not using fetch

``` cmd
.\pip_install sbs_example
```



## lib_install.bat
This used to install and dependencies that are sbslib files.

sbslib is a alternative to pip, and does not git either. (but does use github)

a sbslib is a zip file with the code for the library.


Place this file in the data\missions directory

lib_install.bat is called by fetch. or needs to be called manually if not using fetch


``` cmd
.\lib_install mymission artemis-sbs sbs_utils v0.0.4
```
this will place sbs_utils.sbslib in the mymission folder from the v0.0.4 release on github.



