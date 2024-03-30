terraform {
  required_version = ">= 1.1.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}


provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://192.168.100.23:8006/api2/json"
    pm_password = "wikipx"
    pm_user = "root@pam"
}

resource "proxmox_vm_qemu" "cloudinit-test" {
    count = 3
    name = "k8s-1${count.index + 1}"
    target_node = "pve"
    clone = "ubuntu-cloud"
    agent = 1
    os_type = "cloud-init"
    cores = 4
    sockets = 1
    cpu = "host"
    memory = 4096
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"


    network {
        model = "virtio"
        bridge = "vmbr2"
    }
    
    lifecycle {
        ignore_changes = [
        network,
        ]
    }
    sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7j3k7qDDUQniXdhmWeCYJHxrbMbvVrCrTqcSA4858uW4Z6RdJhblcGZy4a/K6fIvMvqHk0Xbns3jcHviB0Tyk8gEySwc87qfmEaUsRNflAkvqfKIw+q2qJ1yRev6s01xp6Z8pLLtrbm3HKxHmdnGJPCTN7vItvvfbEnWydJ5nLWmSnUA12LCmgqg0gWYE0QEs5UHzyd5rVgQM6h4DabTbylKIjoG5Iy3oUqZ5BY9NMgTnHhee8ZD0WnhtMWRGjgHXjp0WWV9bEdgcNWxLaMt+MuK1FFpFFa5QFXFAg54K9A1HkPjYv/m3NdhsKE9gJgzRGHXbTpj0ZaaYTfCX6tLf"
}