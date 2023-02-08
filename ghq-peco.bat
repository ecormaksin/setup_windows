@echo off
for /f "tokens=*" %%x in ('ghq list -p ^| peco') do (
  cd %%x
  break
)