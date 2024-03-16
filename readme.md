ReaPack/reapack-index検証用リポジトリです

```
https://github.com/ePi5131/reapack-index-test/raw/index/index.xml
```

## 構成について
このような運用を実験しています
- スクリプトの変更は最終的にmasterブランチに集約する
  - 必要ならmasterからブランチを切ってあれこれする
- GitHub Actionsのワークフローをmasterブランチへの変更で発火する
  - indexブランチへとreapack-indexを実行する
- 最終的に`https://github.com/<user>/<repo>/raw/index/index.xml`がリポジトリURLになる
