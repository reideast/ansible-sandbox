#!/bin/bash -e

if [[ ! -f id_rsa_vagrant ]]; then
    echo "Creating an SSH keypair for Vagrant to use"
    # Generate a keypair:
    #    - Filenames: id_rsa_vagrant id_rsa_vagrant.pub
    #    - Comment in the .pub file of "vagrant@local"
    #    - No passphrase (-N '')
    #    - 2048 bits of entropy, which is more than adequate for local testing
    ssh-keygen -t rsa -b 2048 -C "vagrant@local" -N '' -f ./id_rsa_vagrant
fi
