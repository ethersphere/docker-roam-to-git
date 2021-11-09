roam-to-git docker image

Contains geckodriver and jet (makes EDN backup diffable)

USAGE:
cp env.example .env (insert Roamresearch credentials and graph you want to save)
mkdir roam-repo; git init roam-repo
docker-compose up -d


TODO: build jet instead of downloading the binary
