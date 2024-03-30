# Steps required for creating cloud init from ubuntue cloud image Installation

1.Download the ISO using the GUI (https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img).
2.update the packages and install libguesttfs-tools to customize the images to install qemu-guest-agent.

``` bash
 apt update -y && apt install libguestfs-tools -y
```

3.update the image file with some customizations

``` bash
virt-customize -a ubuntu-cloudimg-amd64.img --install qemu-guest-agent
```

4.Create the VM tyemplate via qm which is a Cli tool for proxmox  

```  bash
qm create 5000 --memory 2048 --core 2 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
cd /var/lib/vz/template/iso/
qm importdisk 5000 ubuntu-cloudimg-amd64.img local-lvm
qm set 5000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-5000-disk-0
qm set 5000 --bios ovmf --efidisk0 local-lvm:1,format=qcow2,efitype=4m,pre-enrolled-keys=1
qm set 5000 --ide2 local-lvm:cloudinit
qm set 5000 --boot c --bootdisk scsi0
qm set 5000 --serial0 socket --vga serial0
qm template 5000
```

3.Expand the VM disk size to a suitable size (suggested 10 GB)
4.Create the Cloud-Init template
5.Deploy new VMs by cloning the template (full clone)
