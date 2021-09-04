#!/usr/bin/env sh


# abort on errors
#set -e

rm -rf dist 

# build
npx slidev build --base /p1/

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:boldak/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f https://github.com/edu-dis-presents/p1.git master:gh-pages

cd -
