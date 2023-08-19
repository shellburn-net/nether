# nether
Bastion docker

#### Requiremets:
```
docker compose
sha256sum
```

#### Usage
```
./nether            - start and exec to nether container.
./nether v          - start and exec to nether conatiner but show verbose build process.

/data               - Shared directory (in a future this could be a remote directory).
                      This is also a default current working dir.
/workdir            - Just an ordinary directory, where you could expect to find temporary
                      files. This is a default destination of toolbox scripts.
/toolbox            - Various scripts. Scripts also available directly from command line.
                      Well, at least should be :)
```

#### Config
.env file presetup is not necessary, but is recomended.
```
# .env
user=foobar         - Specify linux user to be created inside the container (default: foobar).
shared_dir=/data    - Specify shared dir to be attached to the container (default: /data)
                      (if shared dir does not exist, it will be created!).
```

#### TODO
```
- task: Clean up dot_files/dot_bashrc

- research: Think how to solve secrets (like ssh private keys) using inside container.
- research: Keep bash history through docker builds.
```
