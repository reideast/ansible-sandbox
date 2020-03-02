# Vagrant: Multiple VMs

Create 3 CentOS VMs with sequential static IPs

## How to Run
```shell script
vagrant up
```

There will now be 3 VMs with local IPs 192.168.33.11 & .12 & .13.

## SSH Login

Additionally, a small script will have run which created an SSH keypair for you to use.
SSH to any of these VMs with username `vagrant` and identity file `ansible-sandbox/secrets/id_rsa_vagrant`, for example:

```shell script
ssh -i ../secrets/id_rsa_vagrant vagrant@192.168.33.11
```


## How to Stop
```shell script
vagrant destroy
```
