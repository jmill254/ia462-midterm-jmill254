# Midterm.md

## 1 What this repo is:
This repository contains all of the required deliverables (files and screenshots) from my midterm lab. It covers my security configuration on Windows, Linux, and Docker. I completed vulnerability scans and dependency checks using tools such as lynis, trivy, syft, and grype. I also include my configured Github actions and Dependabot settings to identify vulnerable dependencies. I also performed system hardening, built and tested a hardened docker container, and configured my Github supply chain security. 

## 2 Cross-platform hardening comparison:



| Control Area | Linux | Windows | Docker |
|---|---|---|---|
| Kernel Model | Linux kernel with full userspace isolation | Windows NT kernel with kernel/user space separation | Shares host OS kernel (Linux or Windows); containers share kernel but have isolated user space via namespaces/cgroups and non root users |
| Access Control | Linux uses permission bits (read, write, execute) for owner, group, and others. | Windows uses ACLs to assign more specific access to users and groups. | Docker uses namespaces to isolate containers and limit access to the host system. |
| Auditing/Logging | Linux stores system activity logs in /var/log. | Windows uses Event Viewer and audit policies to record security events. | Docker uses container logs to monitor activity in individual containers. |
| Hardening Standard | Linux uses CIS benchmarks, disables unused services, configures firewalls, and secures SSH. | Windows uses CIS baselines, disables SMBv1, and configures security policies. | Docker uses CIS Docker benchmarks, minimal images, and least-privilege settings. |
| Common Attack Surface | SSH, unused services, and misconfigured permissions. | RDP, SMBv1, and exposed services. | privileged containers, exposed Docker sockets, and unscanned images. |

Linux, Windows, and Docker use different security controls to protect their systems. For Linux, I would disable unused services, while for Windows I would disable older protocols such as SMBv1. For Docker, I would run containers as non-root users to limit their permissions.

## 3 Supply-Chain Threat Model
If an attacker wanted to target this repo, they could add vulnerable dependencies, use an insecure docker image, or make unauthorized changes to the code (week 8 slide 10). Dependabot and pip-audit help catch vulnerable packages, while trivy and grype scan containers for security issues (week 8 slide 8, week 6 slide 16). Making sure docker containers are run as non-root users will limit the amount of damage an attacker could do if they gain access (week 5 slide 6). Finally Github actions is set up to run security checks on all changes, along with branch protection requiring these checks to pass before anything can be merged to the main branch (week 8 slide 14).

## 4 Learning Objectives

- Section 1, Linux Hardening          - Implement Windows and Linux best practices to protect against Supply Chain Attacks.
- Section 2, Windows Security         - Implement Windows and Linux best practices to protect against Supply Chain Attacks.
- Section 3, Docker Hardening         - Apply enterprise patch and policy management for Docker Containers, including container hardening.
- Section 4, Vulnerability Scanning   - Perform Vulnerability Management: scan, patch, and retest continuously using CI/CD techniques in GitHub. / Understand and integrate Software Bill of Materials (SBOM) into Docker Container workflows.
- Section 5, Policy Enforcment        - Utilize Supply Chain Security Techniques across Windows, Linux, and Docker container environments.
- Section 6, Dependency Security      - Configure and manage third-party security scanners within a GitHub CI/CD pipeline. / Apply Dependency Pinning, Version Control, and Hashing to reduce surprise supply chain attacks.
