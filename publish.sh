#!/bin/bash
echo Deploy production site

./clean.sh

./vendor/bin/sculpin generate --env=prod

find ./output_prod/ -name ".git" -exec rm -rf {} \;

rm -rf ./gh-pages-deployment
git clone git@github.com:cocciagialla/cocciagialla.github.io.git ./gh-pages-deployment
cd gh-pages-deployment
git checkout master

rsync --quiet --archive --filter="P .git*" --exclude=".*.sw*" --exclude=".*.un~" --delete ../output_prod/ ./
git add -A :/
git commit -a -m "Deploying sculpin-generated pages to \`master\` branch"
git push origin master

echo done!
