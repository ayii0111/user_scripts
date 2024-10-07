# 安裝
npm i -D eslint eslint-plugin-format
npm i -D @antfu/eslint-config@2.27.3

# 若安裝報錯要退出
[[ $? != 0 ]] && return 1

# 將預設的 eslint 改變格式
# 整個預設檔刪除，建立新的
rm .eslintrc.cjs

echo "import antfu from '@antfu/eslint-config'

export default antfu()" >eslint.config.mjs

echo '{
  // Disable the default formatter, use eslint instead
  "prettier.enable": false,
  "editor.formatOnSave": true,

  // Auto fix
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit",
    "source.organizeImports": "never"
  },

  // Silent the stylistic rules in you IDE, but still auto fix them
  "eslint.rules.customizations": [
    { "rule": "style/*", "severity": "off", "fixable": true },
    { "rule": "format/*", "severity": "off", "fixable": true },
    { "rule": "*-indent", "severity": "off", "fixable": true },
    { "rule": "*-spacing", "severity": "off", "fixable": true },
    { "rule": "*-spaces", "severity": "off", "fixable": true },
    { "rule": "*-order", "severity": "off", "fixable": true },
    { "rule": "*-dangle", "severity": "off", "fixable": true },
    { "rule": "*-newline", "severity": "off", "fixable": true },
    { "rule": "*quotes", "severity": "off", "fixable": true },
    { "rule": "*semi", "severity": "off", "fixable": true }
  ],

  // Enable eslint for all supported languages
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "html",
    "markdown",
    "json",
    "jsonc",
    "yaml",
    "toml",
    "xml",
    "gql",
    "graphql",
    "astro",
    "svelte",
    "css",
    "less",
    "scss",
    "pcss",
    "postcss"
  ]
}' >.vscode/settings.json

# 覆蓋 eslint.config.mjs 檔的內容
cp $HOME/UserConfig/config/eslint.config.mjs eslint.config.mjs

# 操作 vscode 執行 reload 指令
osascript <<EOF
tell application "Cursor"
  activate
  delay 0.5
  tell application "System Events"
    keystroke "p" using {command down, shift down}
    delay 0.5
    keystroke "reload window"
    delay 0.5
    key code 36 -- Press Enter
  end tell
end tell
EOF
