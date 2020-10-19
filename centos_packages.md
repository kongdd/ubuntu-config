```bash
## 0. rstudio-desktop tutorial
# Enable the Extra Packages for Enterprise Linux (EPEL) repository
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# On RHEL 8, enable the CodeReady Linux Builder repository
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

# If running RHEL 8 in a public cloud, such as Amazon EC2, enable the CodeReady
# Linux Builder repository from Red Hat Update Infrastructure (RHUI) instead
sudo dnf install dnf-plugins-core
sudo dnf config-manager --set-enabled "codeready-builder-for-rhel-8-*-rpms"

# On CentOS 8, enable the PowerTools repository
sudo dnf install dnf-plugins-core
sudo dnf config-manager --set-enabled PowerTools

## 1. install htop
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum update

## 2. install R
sudo dnf install epel-release
sudo dnf config-manager --set-enabled PowerTools

```
