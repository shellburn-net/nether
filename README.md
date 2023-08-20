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
- task: File .env should be populated with default values if it oes not exist, or some values
        are missing. And then used generate build conatiner as usual.
- task: Implement a templating solution to generate the compose file, allowing for a variable
        number of shared directories. Directories can be defined in the following manner:
        shared_dirs=/data:/data,/home/john:/john,/etc/hosts:/hosts:ro
- task: New config variable for Nether config file - nether.yml. It's a yaml file, which
        contains variuos nether settings, example, location of your ssh keys, bashrc theme,
        etc. If this file is not exist, it will be created in the specified location. If
        location is not specified, it will we created in /workdir dir, although that is not
        ideal, as this file will be lost everytime container rebuilts.
- task: Allow to choose user id in .env file, as id=1000 not always the right one.
- task: Add sudo
- task: Add ruby

- idea: Think how to solve secrets (like ssh private keys) using inside container.
- idea: Keep bash history through docker builds.
- idea: Allow to extend nether /etc/hosts file with any amount of provided files. Here's
        How it could work: in nether.yml file we could have an entries like this:
        hosts_extends:
          - /local_mount/hosts
          - /data/personal/my_hosts
        Initail script when ever conatiner is starting could additionally populate main
        /etc/hosts file with these ones.
- idea: Have a new variable in .env for default current working dir. This is an optional, and if
        it's not specified, then the first on shared_dirs list will be selected.

```

#### Dev
```
- Typically, to better distinguish between 'nether' scripts and others, it's good practice
  to include a hint "Powered by Nether!" in the script's help/usage output.
```
