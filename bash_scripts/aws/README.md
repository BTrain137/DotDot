
- Terminal exits after commands are finishing executing
```bash
# Run a single command
ssh -i key.pem ubuntu@0.0.0.0 'uptime'

# Multiple commands
ssh -i key.pem ubuntu@0.0.0.0 'sudo apt-get update && sudo apt-get upgrade'

# Multiple commands
ssh -i key.pem ubuntu@0.0.0.0 << 'ENDSSH'
sudo apt-get update
sudo apt-get upgrade
ENDSSH

# Run a file of commands on the remote server
ssh -i key.pem ubuntu@0.0.0.0 'bash -s' < update-instance.sh
```
