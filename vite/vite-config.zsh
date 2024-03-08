#! /bin/zsh

# 別名 vconf
# npm run dev自動打開瀏覽器
local server_open=$(cat <<'EOF'

  server: {
    open: true //vite项目启动时自动打开浏览器
  },
EOF
)

server_open=$(echo "$server_open" | gsed ':a;N;$!ba;s/\n/\\n/g')

for file (./vite.config.{t,j}s) {
  if [[ -f $file ]] {
  gsed -i "/export default defineConfig({/ s|$|$server_open|" $file
  }
}