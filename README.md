# libvirtbuilder

Deploying infrastructure with terraform & libvirt/kvm

## Configuration

### Create mamba environment

```
wget -qO- https://micromamba.snakepit.net/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
./bin/micromamba create --file environment.yml --yes -r $PWD/.micromamba
export PATH=$PWD/.micromamba/envs/default/bin:$PATH
```

### Create SSH Keys

```
ssh-keygen -q -N "" -f id_rsa
```

### Create .env

```
cat > .env <<'EOF'
export OS_REGION_NAME='GRA9'
export OS_AUTH_URL="https://auth.cloud.ovh.net/v3/"
export OS_IDENTITY_API_VERSION="3"
export OS_USER_DOMAIN_NAME="Default"
export OS_PROJECT_DOMAIN_NAME="Default"

export OS_TENANT_ID="XXXXXXXXX"
export OS_TENANT_NAME="XXXXXXXXX"
export OS_USERNAME="user-XXXXXXXXX"
export OS_PASSWORD="XXXXXXXXX"
export TF_VAR_keypair_name="MyUniqueName"

export TF_VAR_ansible_user="ubuntu"
export TF_VAR_region=$OS_REGION_NAME
export TF_VAR_auth_url=$OS_AUTH_URL
export TF_VAR_user_name=$OS_USERNAME
export TF_VAR_password=$OS_PASSWORD
export TF_VAR_user_domain_name=$OS_USER_DOMAIN_NAME
export TF_VAR_tenant_name=$OS_TENANT_NAME
export TF_VAR_tenant_id=$OS_TENANT_ID
EOF

source .env
```

### Show available images

```
openstack image list
```

### Show available images

```
openstack flavor list
```

## Set image + flavour

### For Baremetal Server

```
export TF_VAR_ansible_user="ubuntu"
export TF_VAR_image_name="Baremetal - Ubuntu 20.04"
export TF_VAR_flavor_name="metal.eg-32"
```

### For Public Cloud Server

```
export TF_VAR_ansible_user="debian"
export TF_VAR_image_name="Debian 11"
export TF_VAR_flavor_name="d2-8"
```

## Set Instance Name

```
export TF_VAR_instance_name="myfirstinstance"
```

## Deploy OpenStack Instance with terraform manualy

```
cd tf/openstack
terraform init
terraform plan
terraform apply -auto-approve
```

### Show deployed server

```
openstack server list
```

### Show deployed keypair

```
openstack keypair list
```

### Show terraform state

```
terraform state pull
```
## Login

### Debian
ssh -i id_rsa debian@Ext-Net-IP

### Ubuntu
ssh -i id_rsa debian@Ext-Net-IP

## Fixing "Key pair  already exists" error

openstack keypair delete KeyPairName

## Destroy deployment

terraform destroy

## Show ansibe terraform inventory

ansible-inventory --list

## Test ansible login 
ansible all -m ping