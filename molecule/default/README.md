# Run development container

```
docker run --rm -ti -v $(pwd):/srv/netdata -v /run/docker.sock:/run/docker.sock docker:git sh

apk add --no-cache python3 gcc make python3-dev libffi-dev musl-dev openssl-dev
cd /srv
python3 -m venv venv
echo '*' > venv/.gitignore
. venv/bin/activate
cd netdata
pip3 install ansible molecule[docker]
PYTHONWARNINGS=ignore molecule test
```
