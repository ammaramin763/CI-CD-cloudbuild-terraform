Deploys a Google Cloud Storage (GCS) bucket using Terraform + Cloud Build CI/CD triggered from GitHub.

🚀 Features
✅ Fully automated deployment on every GitHub push

✅ Unique bucket name with random suffix

✅ Zero manual intervention (auto-approve)

✅ Works on any branch

✅ Production-ready Terraform code

📁 Project Structure
text
├── cloudbuild.yaml     # Cloud Build pipeline
└── main.tf            # Terraform GCS bucket
🔧 Quick Setup (2 minutes)
1. Update Project ID
Edit main.tf:

text
provider "google" {
  project = "YOUR-PROJECT-ID-HERE"  # ← Add your GCP project
  region  = "us-central1"
}
2. Create Cloud Build Trigger
Go to Cloud Build → Triggers

Connect Repository → GitHub → Authorize

Create Trigger:

text
Name: gcs-bucket-deploy
Event: Push to any branch
Source: your-github-repo
Build config: cloudbuild.yaml
Substitution: _PROJECT_ID=your-project-id
3. Push to Deploy
bash
git add .
git commit -m "Deploy GCS bucket"
git push origin main
Bucket deploys automatically! 🎉

🛠️ How It Works
text
GitHub Push → Cloud Build Trigger → Terraform Init → Validate → Apply
                                                      ↓
                                                Bucket Created!
Push code to any branch

Cloud Build runs cloudbuild.yaml

Terraform creates GCS bucket with unique name

Output shows bucket name in Cloud Build logs

📋 Cloud Build Logs
Check deployment status:

text
https://console.cloud.google.com/cloud-build/builds
Example bucket name: my-bucket-ab12cd34

🔒 Permissions Required
Cloud Build service account needs:

text
roles/storage.admin
roles/cloudbuild.builds.builder
🎯 Usage
Development: Push to dev branch

Production: Push to main branch

Testing: Push to any feature branch

🧹 Cleanup
bash
# Destroy via Cloud Build
echo "force_destroy = false" >> main.tf
git commit -m "Disable force_destroy"
git push

# Or manual destroy
terraform destroy
📈 CI/CD Pipeline
Step	Action	Duration
1	terraform init	30s
2	terraform validate	5s
3	terraform apply	45s
Total: ~1.5 minutes from git push to bucket ready!

🤝 Contributing
Fork repo

Create feature branch (git checkout -b feature/amazing)

Commit changes (git commit -m "Add amazing feature")

Push → Auto-deploys to test bucket!

📄 License
MIT License - use it freely! 🚀

Built with ❤️ for DevOps automation
Deployed via Cloud Build from GitHub
