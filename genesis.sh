git config --global user.email liu.runpeng1019@gmail.com
git config --global user.name "RL"

if [ ! -x "$(command -v brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Upgrade Bash to v5.0+
LOCAL_BASH="/usr/local/bin/bash"
if [ ! -f "$LOCAL_BASH" ]; then
    brew install bash
    echo "$LOCAL_BASH" | sudo tee -a /etc/shells
    sudo chsh -s "$LOCAL_BASH"
fi

# Node/NPM
NVM_DIR="/Users/$USER/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    brew install nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm install --lts
    # Global NPM packages
    npm i -g nodemon yarn create-react-app @angular/cli expo-cli ngrok
fi

# Python
PYTHON_DEFAULT_VERSION=3.7.5
if [ ! -x "$(command -v pyenv)" ]; then
    brew install pyenv
fi
if [ ! -d "$(pyenv root)/plugins/pyenv-install-latest" ]; then
    git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)/plugins/pyenv-install-latest"
    pyenv install-latest 2.7
    pyenv install-latest # installs latest 3.x
    pyenv install $PYTHON_DEFAULT_VERSION
    pyenv global $PYTHON_DEFAULT_VERSION
fi

# MongoDB
MONGODB_VERSION=4.2
if [ ! -x "$(command -v mongod)" ]; then
    brew tap mongodb/brew
    brew install mongodb-community@${MONGODB_VERSION}
fi

# Kubernetes
if [ ! -x "$(command -v kubectl)" ]; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/darwin/amd64/kubectl
    chmod +x ./kubectl
    mv ./kubectl /usr/local/bin/kubectl
fi

# Terraform
TERRAFORM_VERSION=0.12.13
if [ ! -x "$(command -v terraform)" ]; then
    TERRAFORM_ZIP=terraform_${TERRAFORM_VERSION}_darwin_amd64.zip
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_ZIP}
    unzip $TERRAFORM_ZIP
    rm $TERRAFORM_ZIP
    chmod +x ./terraform
    mv ./terraform /usr/local/bin/terraform
fi

# AWS-cli
if [ ! -x "$(command -v aws)" ]; then
    AWSCLI_BUNDLE="awscli-bundle.zip"
    curl "https://s3.amazonaws.com/aws-cli/${AWSCLI_BUNDLE}" -o "${AWSCLI_BUNDLE}"
    unzip $AWSCLI_BUNDLE
    sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
    rm $AWSCLI_BUNDLE
fi

# Update .bashrc
cp ~/.bashrc ~/.bashrc.bak
cp .bashrc ~/.bashrc
source ~/.bashrc