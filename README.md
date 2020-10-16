# Docker uilicious-cli

This Docker Image allows you to use uilicious-cli in a Docker container.
It can be used locally or during your Continuous Integration Process.

# Usage

You  can use all uilicious commands. The full documentation can be found here :  https://github.com/uilicious/uilicious-cli

You just need to use the `docker run` prefix :

```
$ docker run -it acseo/uilicious-cli sh -c "uilicious-cli xxx put your command here"
```


# Usage examples

## Backup / Download Uilicious tests :

Edit *UILICIOUS_KEY*  and *PROJECT_NAME* and launch the command

```bash
$ docker run -it -v $(PWD):/tests-backups acseo/uilicious-cli sh -c "uilicious-cli download --key UILICIOUS_KEY 'PROJECT_NAME' /tests-backups"
```
## List Remote Uilicious tests : 

Edit *UILICIOUS_KEY*  and *PROJECT_NAME* and launch the command

```bash
$ docker run -it acseo/uilicious-cli sh -c "uilicious-cli download --key UILICIOUS_KEY 'PROJECT_NAME' /tmp | grep 'Downloaded file' | sed 's/Downloaded file - \/tmp\///g' | sed 's/.test.js//g' | sort"
```

## Launch a test : 

Edit *UILICIOUS_KEY*,  *PROJECT_NAME* and *TEST_TO_RUN* and launch the command

```bash
$ docker run -it acseo/uilicious-cli sh -c "uilicious-cli run 'FFTT' 'TEST_TO_RUN' --key UILICIOUS_KEY"
```
