# Change Proxmox Enterprise Subscription to No Subscription

This guide will help you change your Proxmox VE (Virtual Environment) from an enterprise subscription to a no-subscription setup. 

## Steps

1. **Backup your data**: Before making any changes, ensure you have a backup of your data.

2. **Remove Enterprise Repository**: The first step is to remove the enterprise repository from your Proxmox VE. You can do this by commenting out the enterprise repository line in the `pve-enterprise.list` file. Open the file with a text editor:

```bash
nano /etc/apt/sources.list.d/pve-enterprise.list
```

Then, comment out the line by adding a `#` at the start:

```bash
#deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise
```

3. **Add No-Subscription Repository**: Next, you need to add the no-subscription repository to your `sources.list` file. Open the file:

```bash
nano /etc/apt/sources.list
```

Then, add the following line at the end of the file:

```bash
deb http://download.proxmox.com/debian/pve buster pve-no-subscription
```

4. **Update and Upgrade**: Finally, update your package lists and upgrade your system:

```bash
apt-get update && apt-get dist-upgrade
```

5. **Reboot**: Reboot your system to ensure the changes take effect:

```bash
reboot
```

After following these steps, your Proxmox VE should now be using the no-subscription repository.

https://pve.proxmox.com/wiki/Package_Repositories