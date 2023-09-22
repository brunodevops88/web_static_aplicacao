stage 'Checkout'
 node('cluster Kubernetes azure') {
 }

node('cluster Kubernetes azure'){
  sh 'sudo apt-get update'
  sh 'sudo cd SITEWEB'
  sh 'sudo chmod 766 cluster.sh'
  sh 'sudo ./cluster'
}