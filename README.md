# gnu-linux-initial-setup

Baseline script for Internet-facing hosts.

Tested OS: Ubuntu 22.04 LTS, 24.04 LTS


#### Requirements
```
% ansible-galaxy install -r requirements.yaml
```


#### Playbook

```
% ansible-playbook system.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 -e "target_hosts=local-vm" 
% ansible-playbook system.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 -e "target_hosts=local-vm" -t sysctl_net
```


#### Commands

```
% ansible all -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 --forks 1 -b -a whoami
% ansible all -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 --forks 1 -b -m reboot
```


#### Contributions

`ansible-lint` should run successfully.