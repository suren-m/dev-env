# WSL2 specific items

### Initial Setup prior to running wsl2.yml playbook

```bash
chmod +x ./init.sh
./init.sh
```

#### Notes:
* /etc/profile fix for PATH - fixes code not found issue.
* install prerequisites - git, curl, python, pip ansible
* backup ~/.bashrc and /etc/profile


#### Optional:
* pipenv
```bash
pip install pipenv
# Make sure to add ~/.local/bin to path for pipenv to work 
````

