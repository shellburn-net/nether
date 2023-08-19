# nether
Bastion docker

#### Requiremets:
```
docker compose
sha256sum
```

#### Usage
```
./nether            - start and exec to nether container
./nether v          - start and exec to nether conatiner but show verbose build process
```

### Config
.env file presetup is not necessary, but is recomended.
```
# .env
user=foobar         - Specify linux user to be created inside the container (default: foobar)
shared_dir=/data    - Specify shared dir to be attached to the container (default: /data)
                      (if shared dir does not exists, it will be created!)
```

