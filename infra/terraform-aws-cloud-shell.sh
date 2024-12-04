git clone https://github.com/tfutils/tfenv.git ~/.tfenv

mkdir -p ~/bin
ln -s ~/.tfenv/bin/* ~/bin/

tfenv install latest

tfenv use latest

terraform --version

aws s3api create-bucket --bucket eks-terraform-iza-23-02-1988  --region us-east-1

# optinal command
# aws eks list-clusters --region us-east-1
# aws eks update-kubeconfig --name eks-cluster --region us-east-1


aws iam create-policy --policy-name AmazonEKS_EBS_CSI_Driver_Policy --policy-document file://ebs_csi_policy.json
EKS_CLUSTER_ROLE_NAME=$(aws eks describe-cluster --name eks-cluster --region us-east-1 --query "cluster.roleArn" --output text | cut -d '/' -f 2)
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
aws iam attach-role-policy --policy-arn arn:aws:iam::$AWS_ACCOUNT_ID:policy/AmazonEKS_EBS_CSI_Driver_Policy --role-name $EKS_CLUSTER_ROLE_NAME

# or mannually
aws iam attach-role-policy --policy-arn arn:aws:iam::$AWS_ACCOUNT_ID:policy/AmazonEKS_EBS_CSI_Driver_Policy --role-name node-group-1-eks-node-group-20241204084505172000000002

aws iam attach-role-policy --policy-arn arn:aws:iam::$AWS_ACCOUNT_ID:policy/AmazonEKS_EBS_CSI_Driver_Policy --role-name node-group-2-eks-node-group-20241204084505174200000003


helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver/
helm repo update
helm install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver --namespace kube-system --set enableVolumeScheduling=true  --set enableVolumeResizing=true --set enableVolumeSnapshot=true


helm repo add bitnami https://charts.bitnami.com/bitnami

helm install mongo bitnami/mongodb -f values.yaml

