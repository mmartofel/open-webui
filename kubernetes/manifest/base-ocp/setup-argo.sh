oc new-project open-webui

oc adm policy add-cluster-role-to-user cluster-admin -z default -n open-webui
oc adm policy add-cluster-role-to-user cluster-admin -z builder -n open-webui
oc adm policy add-cluster-role-to-user cluster-admin -z deployer -n open-webui
oc adm policy add-cluster-role-to-user cluster-admin -z pipeline -n open-webui
oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n open-webui

oc create -f argo-app.yaml -n openshift-gitops

