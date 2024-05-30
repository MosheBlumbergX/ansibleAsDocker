```
export VERSION=7.6.1
docker build --build-arg VERSION=$VERSION -t mosheblumberg/mosheblumbergansible:ansible2.147CP$VERSION .
docker push mosheblumberg/mosheblumbergansible:ansible2.147CP$VERSION

git checkout -b $VERSION-post
git add .
git commit -m "from snippet"
git push -u origin $VERSION-post


for i in {1..5}; do export VERSION=7.4.$i \
&& echo $VERSION \
&& `docker build --build-arg VERSION=$VERSION -t mosheblumberg/mosheblumbergansible:ansible2.147CP$VERSION .` \
&& `docker push mosheblumberg/mosheblumbergansible:ansible2.147CP$VERSION` \
; done 
```