# Ansible Sandbox

Ansible demo by [Sean O'Gorman](https://github.com/seanogor) and [Andrew Reid East](https://github.com/reideast)

```
<creativity>Insert demo here!</creativity>
```

## Setup VMs with Vagrant
### Create a single VM
- Creates a single CentOS 7 VM with:
    - IP: `192.168.33.10`
    - Username: `vagrant`
    - SSH private key: `./secrets/id_rsa_vagrant`
    - The Vagrantfile runs a script generates a new SSH keypair for use with Vagrant VMs
```shell script
cd vagrant-single
vagrant up
# Connect to VM
ssh -i ../secrets/id_rsa_vagrant vagrant@192.168.33.10
# When finished:
vagrant suspend # Save VM state. Continue with "vagrant resume". Or:
vagrant destroy # Delete VM from system permanently. Create again with "vagrant up"
```
### Create x3 VMs
- Creates 3 CentOS 7 VMs with the same properties as above, but:
    - IP: `192.168.33.11`, `192.168.33.12`, `192.168.33.13`
```shell script
cd vagrant-multiple
vagrant up
# When finished:
vagrant suspend # Save VM state. Continue with "vagrant resume". Or:
vagrant destroy # Delete VM from system permanently. Create again with "vagrant up"
```

## Playbooks
### Basic Ansible testing: [hello-world.yml](./hello-world.yml)
```shell script
ansible-playbook -i vagrant-single/inventory-vagrant-single.ini hello-world.yml
```

### Setup a web server [setup-web-server.yml](./setup-web-server.yml)
```shell script
ansible-playbook -i vagrant-single/inventory-vagrant-single.ini setup-web-server.yml
```

### Copy HTML files onto server [install-web-contents.yml](./install-web-contents.yml)
_Note the change in inventory file: This one has an extra variable, which the template uses._
```shell script
ansible-playbook -i vagrant-single/inventory-host-variables.ini install-web-contents.yml
```

## Perform the web server setup on x3 VMs
Runs on the `vagrant-multiple` setup.
Note how it requires two separate Ansible runs? This could be improved by composite playbooks, or better yet, using Ansible "roles"
```shell script
ansible-playbook -i vagrant-multiple/inventory-vagrant-multiple.ini setup-web-server.yml
ansible-playbook -i vagrant-multiple/inventory-vagrant-multiple.ini install-web-contents.yml
```
