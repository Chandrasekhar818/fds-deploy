
ArgoCD + K3s + GitHub CI/CD Setup Documentation

1. Architecture:
Developer → GitHub → GitHub Actions → Docker Hub → Kubernetes → ArgoCD → Deployment

2. Install ArgoCD:
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

3. Expose ArgoCD:
kubectl patch svc argocd-server -n argocd --type='merge' -p '{"spec":{"type":"NodePort","ports":[{"name":"http","port":80,"targetPort":8080,"nodePort":30080},{"name":"https","port":443,"targetPort":8080,"nodePort":30443}]}}'

4. Get Admin Password:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

5. Access UI:
https://<EC2-IP>:30443

6. Create User:
Edit configmap:
KUBE_EDITOR=nano kubectl edit configmap argocd-cm -n argocd
Add:
accounts.tsss: login

Restart:
kubectl rollout restart deployment argocd-server -n argocd

Set password:
argocd account update-password --account tsss

7. Docker Setup:
sudo apt install docker.io -y
docker build -t <username>/fds-app:latest .
docker push <username>/fds-app:latest

8. GitHub Actions:
Create .github/workflows/ci-cd.yaml with CI/CD pipeline

9. ArgoCD App:
Repo: fds-deploy
Branch: deploy
Path: k8s
Namespace: default
Enable auto sync

10. Flow:
Push → Build → Push Image → Update YAML → ArgoCD deploy

