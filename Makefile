apply:
	terraform apply

save-config:
	terraform output kubeconfig > kubeconfig.yml

add-config: save-config
	cp ~/.kube/config ~/.kube/config.$$(date +%Y-%m-%d_%H-%M-%S).backup
	KUBECONFIG=kubeconfig.yml:~/.kube/config kubectl config view --raw > /tmp/kubeconfig.merge.yml && cp /tmp/kubeconfig.merge.yml ~/.kube/config

get-versions:
	doctl kubernetes options versions

get-sizes:
	doctl kubernetes options sizes

apply-ingress:
	KUBECONFIG=kubeconfig.yml kubectl apply -f https://raw.githubusercontent.com/ondrejsika/kubernetes-ingress-traefik/master/ingress-traefik.yml
