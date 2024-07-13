echo off
set archive_path=palworld-server:/home/steam/.local/share/Steam/steamapps/common/PalServer/Pal

docker cp  %archive_path%/Saved ./
echo 存档备份完成 

docker stop palworld-server
echo 服务器停止完成

docker rename palworld-server palworld-server-old
echo 原服务器重命名完成

docker pull liyaosong/palworld
docker run --name palworld-server -p 8211:8211/udp -d liyaosong/palworld
echo 新服务器启动完成

docker cp ./Saved %archive_path%/
echo 存档迁移完成

docker restart palworld-server

echo 请检查测试服务器是否正常运行
echo 请检查存档是否正常迁移
echo 游戏愉快！
pause

