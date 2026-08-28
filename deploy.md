# 部署到 Cloudflare Pages（免费）

个人开发者做公众号/头条涨粉钩子，推荐 Cloudflare Pages：**免费、访问量基本无上限、国内多数地区能打开**。无需服务器、无需备案。

## 方式一：拖拽上传（最省事，适合不改代码时）

1. 把本目录 `reborn-antifraud-local/` 整个压缩成 zip
2. 打开 https://pages.cloudflare.com → 登录 → **Create a project** → **Upload assets**
3. 拖入 zip → 部署完成，得到一个 `xxx.pages.dev` 域名
4. 公众号图文「阅读原文」填这个链接；头条号正文直接放链接

> 之后改了 `levels.js` 想更新，重新上传 zip 覆盖部署即可。

## 方式二：Git 推送（适合持续迭代）

1. 本目录初始化 Git 仓库，推到 GitHub/GitLab
   ```bash
   cd reborn-antifraud-local
   git init && git add . && git commit -m "init"
   git branch -M main
   git remote add origin <你的仓库地址>
   git push -u origin main
   ```
   > `git branch -M main` 不能省：新版 git 默认分支可能是 `master`，不改名直接推 `main` 会报 `src refspec main does not match`。
2. Cloudflare Pages → Create a project → 连接仓库 → Framework 选 `None` → Build command 留空 → Build output 填 `.`（根目录）
3. 以后 `git push` 自动重新部署

## 方式三：CLI（wrangler，适合自动化）

```bash
npx wrangler login
npx wrangler pages deploy ./ --project-name reborn-antifraud
```
> 用 `npx` 直接跑即可，不必全局安装（全局装 wrangler 在某些终端环境会因权限/沙箱报错）。

## 国内访问优化（数据跑起来后再说）

Cloudflare 免费版不走中国大陆节点，高峰期偶发抖动。若真有量，可加一层**国内 CDN 回源**（腾讯云/阿里云 CDN 回源到 `xxx.pages.dev`），几十元/月即可把速度拉满。初期不必。

## 微信/头条接入提醒

- **个人订阅号**：图文里不能直接插外链，只能用「阅读原文」或自定义菜单（菜单域名需 ICP 备案）。
- **头条号**：对外部 H5 友好得多，正文可直接放链接，建议先做头条试水验证数据。
- **小程序/小游戏**：个人资质做不了游戏类目，需注册个体户/公司。初期不碰。
