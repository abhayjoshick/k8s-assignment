# k8s-assignment
Basic k8s application running on EKS

![image](https://github.com/user-attachments/assets/f75a07a1-d398-46c5-9735-61477456881f)


## Prerequisites
- AWS CLI installed and configured
- kubectl installed
- AWS IAM permissions for EKS
- AWS EKS cluster set up
- Docker installed
- Git installed

## Steps to Deploy

### 1. Clone the Repository
```sh
 git clone https://github.com/abhayjoshick/k8s-assignment.git
 cd k8s-assignment
```

### 2. Build and Push Docker Image to AWS ECR
```sh
aws ecr create-repository --repository-name assignment

$(aws ecr get-login --no-include-email --region <your-region>)

docker build -t assignment .
docker tag assignment:latest <aws-account-id>.dkr.ecr.<your-region>.amazonaws.com/assignment:latest
docker push <aws-account-id>.dkr.ecr.<your-region>.amazonaws.com/assignment:latest
```

### 3. Deploy to AWS EKS
#### Update kubeconfig for EKS
```sh
aws eks update-kubeconfig --region <your-region> --name <cluster-name>
```

#### Apply Kubernetes Manifests
```sh
kubectl apply -f k8s/
```

#### Verify Deployment
```sh
kubectl get pods
kubectl get services
```

### 4. Access the Application
Find the LoadBalancer URL and access the app:
```sh
kubectl get svc
```
Copy the `EXTERNAL-IP` and open it in a browser.

## Troubleshooting
- Check pod status: `kubectl get pods`
- Describe failing pod: `kubectl describe pod <pod-name>`
- View logs: `kubectl logs <pod-name>`
- Delete and redeploy: `kubectl delete -f k8s/ && kubectl apply -f k8s/`

