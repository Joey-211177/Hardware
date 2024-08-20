@echo off
echo.
echo 确认能否访问CIS数据库服务器
ping 47.122.21.161 -n 3 % 确认能否访问CIS数据库服务器 %
echo.
pause

cls

color 0a
echo.
echo 「有回复」即代表可以访问CIS服务器
echo.
pause
exit