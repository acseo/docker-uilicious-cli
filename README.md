# Docker uilicious-cli

This Docker Image allows you to use uilicious-cli in a Docker container.
It can be used locally or during your Continuous Integration Process.

The container comes with a Makefile that contains useful commands to run

# Usage examples

## Get the list of the commands

```bash
$ docker run -it acseo/uilicious-cli       
```
## Backup / Download Uilicious tests :

Edit *UILICIOUS_KEY*  and *PROJECT_NAME* and launch the command

```bash
$  docker run -it \
    -v $(PWD)/backup:/backup \
    --env BACKUP_FOLDER=/backup \
    --env UILICIOUS_PROJECT=PROJECT_NAME \
    --env UILICIOUS_KEY=UILICIOUS_KEY \
    acseo/uilicious-cli -B backup
```
## List Remote Uilicious tests : 

Edit *UILICIOUS_KEY*  and *PROJECT_NAME* and launch the command

```bash
$  docker run -it \
    --env UILICIOUS_PROJECT=PROJECT_NAME \
    --env UILICIOUS_KEY=UILICIOUS_KEY \
    acseo/uilicious-cli list
```

## Launch a test : 

Edit *UILICIOUS_KEY*,  *PROJECT_NAME* and *TEST_TO_RUN* and launch the command

```bash
$  docker run -it \
    --env UILICIOUS_PROJECT=PROJECT_NAME \
    --env UILICIOUS_KEY=UILICIOUS_KEY \
    --env TEST_TO_RUN=TEST_TO_RUN
    acseo/uilicious-cli test
```

## Launch ALL tests : 

Edit *UILICIOUS_KEY*,  *PROJECT_NAME* and launch the command

```bash
$  docker run -it \
    --env UILICIOUS_PROJECT=PROJECT_NAME \
    --env UILICIOUS_KEY=UILICIOUS_KEY \
    acseo/uilicious-cli all-tests
```

## Launch Uilicious 

```bash
$  docker run -it \
    --entrypoint uilicious-cli 
    acseo/uilicious-cli
```



