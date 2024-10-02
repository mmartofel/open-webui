
echo "Argo admin password is: "
oc extract secrets/openshift-gitops-cluster -n openshift-gitops --keys=admin.password --to -

