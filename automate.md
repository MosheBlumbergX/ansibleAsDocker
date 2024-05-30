```
export VERSION=7.6.1
export ANSIBLE_VERSION=2.13
docker build --build-arg VERSION=$VERSION -t mosheblumberg/mosheblumbergansible:ansible$ANSIBLE_VERSIONCP$VERSION .
docker push mosheblumberg/mosheblumbergansible:ansible$ANSIBLE_VERSIONCP$VERSION

git checkout -b $VERSION-post
git add .
git commit -m "from snippet"
git push -u origin $VERSION-post


for i in {1..5}; do export VERSION=7.4.$i \
&& export ANSIBLE_VERSION=2.13 \
&& echo $VERSION \
&& `docker build --build-arg VERSION=$VERSION -t mosheblumberg/mosheblumbergansible:ansible$ANSIBLE_VERSIONCP$VERSION .` \
&& `docker push mosheblumberg/mosheblumbergansible:ansible$ANSIBLE_VERSIONCP$VERSION` \
; done 
```