#!/bin/bash
revision="$(git describe --tags --abbrev=0) $(git rev-parse --short HEAD)"
timestamp=$(date +%s)
echo '{"revision":"'${revision}'","timestamp":'${timestamp}'}' > ./public/build-meta.json
echo -e 'export const REVISION = '"'"${revision}"'" \
  '\n// eslint-disable-next-line @typescript-eslint/no-loss-of-precision, prettier/prettier' \
  '\nexport const TIMESTAMP = '${timestamp} > ./src/build-meta.ts
sed -i -r 's/([^ \t]+)[ \t]+$/\1/' ./src/build-meta.ts
