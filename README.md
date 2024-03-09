### Infrastructure demo and useful IaC
- Technologies: Terraform, Packer, Nomad, Consul, CICD on EC2, Ansible
### Architecture
- Hub and spoke on the VPC's
    - Systems is hub, environment based vpc's are spokes
    - Systems can communicate with all vpc's, when env vpc's cannot communicate with eachother, only with systems. 
- Systems VPC:
    - CI/CD runners
    - VPN
    - Monitoring
- Per env VPC's
    - dev
    - uat
    - prod

### TODO List:
- Integrate nomad
- Integrate ansible
- Finish ECS in /terraform
- Integrate packer

