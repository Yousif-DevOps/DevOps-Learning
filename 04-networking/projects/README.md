# Projects

Build hands-on projects to reinforce your learning.

## Domain + EC2 + NGINX + DNS

### What I Built
A live web server accessible via my own domain. I registered `yousifdevops.com` through Cloudflare, launched an EC2 instance running NGINX, and pointed a subdomain (`nginx.yousifdevops.com`) to the instance's public IP using a DNS A record.

### Steps Taken
1. **Registered a domain** — `yousifdevops.com` via Cloudflare (~$10.46/year).
2. **Launched an EC2 instance** — Amazon Linux 2023, t3.micro, with a security group allowing HTTP (port 80) from anywhere and SSH (port 22) restricted to my IP.
3. **Installed NGINX automatically via User Data**, so it was ready as soon as the instance booted:
```bash
   #!/bin/bash
   sudo yum update -y
   sudo yum install -y nginx
   sudo systemctl enable nginx
   sudo systemctl start nginx
```
4. **Confirmed NGINX was running** by visiting the instance's public IP directly — saw the default "Welcome to nginx!" page.
5. **Created a DNS A record** in Cloudflare: `nginx.yousifdevops.com` → EC2 public IPv4 address, set to "DNS only" (not proxied) so I could test a direct connection.
6. **Confirmed the domain worked** — visiting `nginx.yousifdevops.com` loaded the same NGINX page.

### What I Learned
- How DNS A records map a human-readable domain to a numeric IP address.
- The difference between "DNS only" and "Proxied" records in Cloudflare.
- How EC2 security groups act as a firewall controlling which ports/IPs can reach an instance.
- How EC2 User Data scripts automate setup so a server is ready the moment it boots.
- The difference between a public IPv4 address and a private IP within a VPC.

### Challenges I Overcame
- **Mixed up HTTP and HTTPS in the security group** — initially checked "Allow HTTPS traffic" instead of "Allow HTTP traffic," so port 80 wasn't open. Fixed by switching the checkbox.
- **"Connection refused" right after launch** — the User Data script takes a minute or two to fully install NGINX on first boot, so I just needed to wait and retry.
- **Understood why SSH stays restricted to "My IP" while HTTP is open to "Anywhere"** — SSH is for my own admin access only, while HTTP needs to be public since that's the point of hosting a website.

### Screenshots
See `/04-networking/screenshots/` for:
- NGINX running via the EC2 public IP
- NGINX running via nginx.yousifdevops.com
- EC2 instance details (running state, public IP)
- Cloudflare DNS A record configuration
 <img width="1389" height="868" alt="image" src="https://github.com/user-attachments/assets/81ef21ec-0d5c-4873-96c1-02f68623f001" />
 <img width="1389" height="868" alt="image" src="https://github.com/user-attachments/assets/796116bd-c57e-4a1a-9dcc-359631c39f7b" />
 <img width="1389" height="868" alt="image" src="https://github.com/user-attachments/assets/107c4c48-1b6a-41fd-956e-3a748b4c757f" />
 <img width="2880" height="1800" alt="image" src="https://github.com/user-attachments/assets/1e21cd00-adfa-4e42-8d71-35e7b17a2cfa" />




