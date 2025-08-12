# ubuntu/jammy64
- [ubuntu/jammy64](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu/jammy64) => versi terbaru 22.04 LTS

```bash
vagrant init ubuntu/jammy64 --box-version 20241002.0.0

mkdir ../data
vagrant up
```

# ubuntu/trusty6
- [ubuntu/trusty6](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu/trusty64) => versi jadul 14.04 LTS (Long Term Support)

```bash
vagrant init ubuntu/trusty64 --box-version 20191107.0.0

vagrant up
vagrant up --provision # up with provision

vagrant provision # provision if vm alredy run
```
