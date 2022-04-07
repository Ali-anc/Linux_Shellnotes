# The following below are some options used by me for securing /etc/ssh/sshd_config. Please do not consider this as complete SSH security guide, but instead determine what is required for you. 


## cp /etc/ssh/sshd_config /root/sshd_config = create a backup before making changes 

- Protocol 2  = Disable Protocol 1
- Port number = Change Default port, if possible 
- AllowUsers  user1 user2 = Limit Users’ SSH Access
- ClientAliveInterval 300 = SSH Idle Timeout Interval 
- ClientAliveCountMax 0 = SSH Client Alive Count
- PermitRootLogin no = disable root login 
- PermitEmptyPasswords no =  Disable SSH Access via Empty Passwords
- HostbasedAuthentication no
- IgnoreRhosts yes = rhosts was a weak method to authenticate systems
- ssh-keygen -t rsa = use Public/Private Keys for Authentication 
- PasswordAuthentication no = Disable password authentication forcing use of keys
- MaxAuthTries 5 =  Limit Maximum Fail Authentication
- HostKey /etc/ssh/ssh_host_ecdsa_key
- HostKey /etc/ssh/ssh_host_ed25519_key
- UseDNS no
- LoginGraceTime # = time allowd for successful authentication to the server via SSH 
- X11Forwarding no = Allows a user to start remote app, but forward the app display to you local. Disable if not need. Graphical Apps over SSH 
- PubkeyAuthentication yes = Use public key authentication. Keys are considered much safer and less prone to brute-force attacks
- ChallengeResponseAuthentication yes = used for google-authenticator
- systemctl restart sshd

> Track root access via the following below
```
echo "ALERT - Root Shell Accessed ${HOSTNAME} on:" `date` by `who` | mail -s "Alert: Root was accessed on `who | cut -d'(' -f2 | cut -d')' -f1`" example@domain.com
```
### This might not be suitable for some environments, since users would need to login to root accounts frequently, which will flood the group email with root login alert.

> Use A jump Server.
> 
If there are multiple servers (physical or VM's), its best practiced to use a central point to access other servers. 
The purpose of the jump server is to act as the gateway for accessing the infrastructure or production servers. From the jump server you 
will be allowed to connect to target machines. This way it reduces the size of any potential surface attack

