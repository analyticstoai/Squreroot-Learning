#execute bash github.sh commit_msg
echo "Build started......"
gulp build
echo "Copying files from build......"
cp -avr build/. analyticstoai.github.io/
cp -avr build/. docs/
commit_msg=$1
echo "Commiting with message:" $commit_msg
git submodule update

cd analyticstoai.github.io
git add .
git commit -m $commit_msg
git push -u origin master

cd ..
git add .
git commit -m $commit_msg
git push -u origin master

