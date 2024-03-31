# Docker Installation Guide for Ubuntu

## Prerequisites
Ensure that you have met the following prerequisites before continuing with this guide:

- You have Ubuntu 16.04 or higher.
- You have sudo privileges.

## Step 1: Update your system
First, update your package list using the following command:

```bash
sudo apt-get update
```

## Step 2: Install Docker
Next, install Docker by running the following command:

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Step 3: Start and Automate Docker
Start Docker and enable it to start at boot:

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

## Step 4: Check Docker Version
To ensure that Docker has been installed correctly, check the version:

```bash
docker --version
```

You should see output similar to the following, depending on the version of Docker installed:

```bash
Docker version 20.10.5, build 55c4c88
```

## Step 5: Run the Docker Command Without Sudo (Optional)
By default, running the `docker` command requires root privileges — in other words, you have to prefix the command with `sudo`. If you want to avoid typing `sudo` whenever you run the docker command, add your username to the docker group:

```bash
sudo usermod -aG docker ${USER}
```

To apply the new group membership, you can log out of the server and back in, or you can type the following:

```bash
su - ${USER}
```

You will be prompted to enter your user's password to continue.

## Conclusion
That's it! You have now installed Docker on your Ubuntu system, and you're ready to start using it.