# Vagrant: CentOS VM

Create a CentOS VM with a static IP

## How to Run
```shell script
vagrant up
```

There will now be a VM with local IP 192.168.33.10.

## SSH Login

Additionally, a small script will have run which created an SSH keypair for you to use.
SSH to this VM with username `vagrant` and identity file `ansible-sandbox/secrets/id_rsa_vagrant`:

```shell script
ssh -i ../secrets/id_rsa_vagrant vagrant@192.168.33.10
```

## How to Stop
```shell script
vagrant destroy
```
