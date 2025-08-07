cd mastro

mkdir -p ./posts/

rm -rf dist
rm -rf ./posts/*.md
echo "[bench] Clean complete"

if [ -z "$1" ]
  then count="1000"
else
  count="$1"
fi
cp ../_markdown-samples/$count/* ./posts/
echo "[bench] Setup complete $count pages"

time deno task generate
echo "[bench] Build complete $count pages"

# echo "[bench] Framework version"

rm -rf ./posts/*.md
echo "[bench] Posts cleanup complete"
