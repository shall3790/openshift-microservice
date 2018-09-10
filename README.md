# openshift-microservice

# Install Elixir microservice on Openshift (replace #branch_name with your feature branch)
`oc new-app --build-env BUILD_ENV=dev -e MIX_ENV=dev openshift/s2i-phoenix:1.5.3~https://github.com/shall3790/openshift-microservice.git#master --context-dir='hello_phx' --name=hello-phx --source-secret=account`

# Remove Elixir microservice
`oc delete all -l app=hello-phx`

# Install Angular microservice on Openshift
`oc new-app myproject/angular:1.7.4~https://github.com/shall3790/openshift-microservice.git#master --context-dir='hello-ng' --name=hello-ng --source-secret=account`

# openshift-microservice
