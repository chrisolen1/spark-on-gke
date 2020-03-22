sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

cat keyfile.json | sudo docker login -u _json_key --password-stdin https://gcr.io





