# gnu-linux-initial-setup

Baseline script for Internet-facing hosts.

Tested OS: Ubuntu 24.04 LTS


#### Collections
```
% ansible-galaxy role install linux-system-roles.journald
% ansible-galaxy collection install devsec.hardening
% ansible-galaxy collection install ansible.posix
```


#### Playbook

```
% ansible-playbook playbook.yaml \
    -i inventory/hosts.yaml \
    --private-key ~/.ssh/id_ed25519 \
    -e "target_hosts=utm" \
    -t install_ollama
```


#### Commands

```
% ansible all -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 -b -a whoami
% ansible all -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 -b -m reboot
```


#### Contributions

`ansible-lint` should run successfully.