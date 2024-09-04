# get version from pubspec.yaml
version=`grep version: pubspec.yaml | awk '{print $2}'`
echo "version: v$version"
# remove local tags
git tag -l | xargs git tag -d
# push tags
git tag -a "v$version" -m "v$version"
echo "push tag v$version"
git push --tags