# Cisco ISE + Ansible Hackathon

Welcome to the Cisco ISE + Ansible Hackathon! This guide contains the agenda, tasks, and structure for participants. It is designed to be used as a workshop handout or as a README.md in a GitHub repository.

---

## 🎯 Goals
- Learn how to automate Cisco ISE using Ansible
- Explore REST API–based network automation
- Build real automation playbooks used in production
- Encourage creativity, problem-solving, and teamwork

---

## 🗂️ Hackathon Structure
The session is divided into four levels:
- **Level 1 (Beginner)** – Getting started, collecting facts
- **Level 2 (Intermediate)** – Configuring ISE (devices, policies, backups)
- **Level 3 (Advanced)** – Building workflows & automation tools
- **Level 4 (Expert)** – Invent your own automation and integrations

Participants progress at their own pace.

---

## 🟢 Level 1 — Warm-Up Tasks (Beginner)

Disse har vi allerede gjort, men bruk ansible-doc og se hvilke moduler som finnes i cisco.ise

---

## 🟡 Level 2 — Practical Network Automation (Intermediate)

### 4. Create New Network Devices in ISE
- Add network devices using `cisco.ise.networkdevice`
- Include IP, name, shared secret
- Try adding several from a list

### 5. Configure Authorization Profile
- View the format of an authorization profile using `cisco.ise.authorizationprofile_info`
- Create a rule using `cisco.ise.authorizationprofile`
- Match on a username
- Apply an authorization profile

### 6. Backup ISE via Ansible
- Configure a repository
- Trigger a backup
- Check backup status

---

## 🔵 Level 3 — Advanced Automation Workflows

### 7. Onboard a New User or Endpoint
- Create user accounts via the ISE API
- Assign identity groups

### 8. Automate Certificate Management
- View certificates
- Generate a self-signed certificate

### 9. Build a "Lab Reset" Automation
- Delete test network devices
- Delete test users
- Remove policies
- Output a change summary

---

## 🔴 Level 4 — Expert / Challenge Tasks

### 10. Build a Dynamic Inventory from ISE
- Query network devices
- Create a structured inventory grouped by:
  - device type
  - location
  - vendor

### 11. Create an ISE Topology Visualizer
- Use facts to map roles:
  - PAN
  - MnT
  - PSN nodes
- Output a Markdown diagram

### 12. Full Site Deployment Automation
- Add devices
- Configure identity stores
- Push policies
- Trigger backup
- Validate deployment

---

## 🎄 Bonus Challenges

### Naughty or Nice Authorization Rule
Create a rule based on username patterns.

### Automatic ISE Documentation Generator
Generate a Markdown report containing:
- Node overview
- Active policies
- Network devices
- User list

---


## 🚀 Tips for Participants
- Use `debug:` to understand data structures
- Keep playbooks small and test often
- Use `register:` to capture API results
- Use loops to automate many objects
- Look at the Cisco ISE API docs for inspiration

---

## 🙌 Enjoy!
Feel free to expand, break things, fix them again — and have fun automating Cisco ISE with Ansible!

