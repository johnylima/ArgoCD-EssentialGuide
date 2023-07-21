kubectl port-forward service/argocd-server -n argocd 8080:443
argocd admin initial-password -n argocd

#dir cd ArgoCD-EssentialGuide\argocd-course-apps-definitions
kubectl apply -f application.yaml
kubectl get application -n argocd

argocd login localhost:8080
argocd login localhost:8080 --insecure
argocd cluster list
argocd app list

#Argocd no create sync automatic, access argocd and sync for deployment app
localhost:8080
kubectl get all -n guestbook

##### create projects use Argo CLI
argocd app list
argocd app create guestbook-2 \
    --repo https://github.com/johnylima/ArgoCD-EssentialGuide.git \
    --revision main \
    --path argocd-example-apps/guestbook \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace guestbook-2 \
    --sync-option CreateNamespace=true

argocd app list
argocd app sync guestbook-2
argocd app list

###### Deploy use Helm chart
kubectl apply -f application-Helm-options.yaml

#add release "helm: releaseName: my-release" in file application-helm.yaml
# apply sync in portal argocd, select prume option for delete oldname and create new name release

###### Deploy use subdirectory
kubectl apply -f application-Directory-options.yaml

###### Deploy use kustomize
kubectl apply -f application-kustomize-options.yaml

###### Deploy multiple sources
kubectl apply -f ingress-nginx.yaml
kubectl apply -f redis.yaml