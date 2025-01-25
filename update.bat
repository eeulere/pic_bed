@echo off

REM 拉取最新代码（防止有远程更新）
echo 正在拉取远程更新...
git pull

REM 添加所有更改的文件
echo 正在添加更改文件...
git add .

REM 提交更改，附加时间戳为 commit 信息
echo 正在提交到本地仓库...
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i
set datetime=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2% %datetime:~8,2%:%datetime:~10,2%:%datetime:~12,2%
git commit -m "更新图片文件 - %datetime%"

REM 推送更新到远程仓库
echo 正在推送到远程仓库...
git push

echo 更新完成！
pause