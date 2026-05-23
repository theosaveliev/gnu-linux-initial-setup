# gnu-linux-initial-setup

Baseline script for Internet-facing hosts.

Tested OS: 24.04 LTS


#### Requirements
```
% ansible-galaxy install -r requirements.yaml
```


#### Initial configuration and hardening
```
% ansible-playbook system.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
% ansible-playbook system.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 -e "target_hosts=node2" -t nft_apply
```


#### Mesh setup
```
% ansible-playbook mesh_setup_home.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
% ansible-playbook mesh_setup_neighbor.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
```


#### Services setup
```
% ansible-playbook docker.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
% ansible-playbook mesh_nginx_home.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
% ansible-playbook mesh_nginx_neighbor.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
% ansible-playbook mesh_services_home.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
% ansible-playbook mesh_services_neighbor.yaml -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519
```


#### Commands

```
% ansible all -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 --forks 1 -b -a whoami
% ansible all -i inventory/hosts.yaml --private-key ~/.ssh/id_ed25519 --forks 1 -b -m reboot
```


#### Contributions

`ansible-lint` should run successfully.