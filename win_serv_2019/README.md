# Windows Server 2019
- https://portal.cloud.hashicorp.com/vagrant/discover/StefanScherer/windows_2019
- StefanScherer/windows_2019

```bash
vagrant init StefanScherer/windows_2019 --box-version 2021.05.15
```

```bash
# DC
vagrant up

vagrant snapshot save default

vagrant snapshot list
vagrant snapshot restore default

# Srv1
cd srv1
vagrant up
vagrant snapshot save default
```

---

# ...
- rgl/windows-server-2019-standard-amd64
