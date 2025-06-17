# 🚀 Strapi CI/CD Deployment using GitHub Actions, Docker, and Terraform

This project demonstrates a complete CI/CD pipeline for deploying a Dockerized Strapi application to an AWS EC2 instance using **GitHub Actions** and **Terraform**.

---

## 📦 Tech Stack

- **Strapi** – Headless CMS
- **Docker** – Containerization
- **Terraform** – Infrastructure as Code (IaC)
- **GitHub Actions** – CI/CD automation
- **AWS EC2** – Cloud deployment

---

## 📁 Project Structure
strapi-docker-terraform-deploy/
├── .github/workflows/main.yml # GitHub Actions workflow
├── strapi/ # Strapi app (Dockerized)
├── main.tf # Terraform configuration
├── variables.tf # Terraform input variables
├── user-data.sh # EC2 bootstrap script


---

## ⚙️ How It Works

1. **Code Push to Main Branch** triggers GitHub Actions.
2. **Builds Docker image** from `strapi/` directory.
3. **Pushes image to Docker Hub**.
4. **Terraform** provisions:
   - EC2 instance
   - Security Group
   - SSH key
5. **User data script** installs Docker and runs Strapi on EC2.

---

## 🛠️ Setup Instructions

### 1. 🔐 Create SSH Key Pair

Generate an SSH key if not already available:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa

2. 📥 Add GitHub Secrets
Name	Description
DOCKER_USERNAME	Your Docker Hub username
DOCKER_PASSWORD	Your Docker Hub password/token
AWS_ACCESS_KEY_ID	AWS access key
AWS_SECRET_ACCESS_KEY	AWS secret key
DEV_PUBLIC_KEY	Content of id_rsa.pub
DEV_PRIVATE_KEY	Content of id_rsa (base64 encoded or plain)**

⚠️ Ensure the private key has proper format and indentation. Do not include passphrase-protected keys.

🚀 Deployment
Once all secrets are set, push to the main branch:

bash
Copy
Edit
git add .
git commit -m "Initial commit with CI/CD pipeline"
git push origin main
GitHub Actions will automatically:

Build and push Docker image.

Initialize Terraform.

Deploy Strapi on AWS EC2.

🌐 Access the App
After successful deployment, get the EC2 Public IP from the Terraform output or AWS Console.

Visit: http://<EC2_PUBLIC_IP>:1337

📹 Demo Video Script
A 5-minute demo video script is available to walk through this project.
1. https://www.loom.com/share/3f2ed3567e8e4cc0833fed9c37f935bc?sid=61fc055a-7bdd-4b63-8996-4d3e536374a0
2.  https://www.loom.com/share/86cb2fd9ea5b48cc94985f9af6cb2ece?sid=33a257ba-7d95-460e-b0c9-8e054caf4c19

