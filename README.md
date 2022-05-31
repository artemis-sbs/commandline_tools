# commandline_tools
Command line batch files etc. for managing Artemis Cosmos missions

This is a simple way to install "DLC" provided the DLC is stored on github

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

Install the Cruiser Tournament Mission Script

``` cmd
fetch artemis-sbs CruiserTournament
```

Copy the sbs-example mission and rename it. This is a good way to install a starter boilerplate template

``` cmd
fetch artemis-sbs sbs-example my-new-mission
```

Install the Cruiser Tournament Mission Script using the branch beta-v2

``` cmd
fetch artemis-sbs CruiserTournament CruiserTournament beta-v2
```



## pip-install.bat
Include this file in a mission to install any python libraries used in the mission.
libraries used are listed in requirements.txt following the same rules as python pip
This batch file will also check to make sure Artemis Cosmos has Pip and install it if it is missing.

pip-install.bat is call by fetch. or needs to be called manually if not using fetch

