@echo off
set bin_path=C:/modeltech64_10.5/win64
cd C:/Users/lenovo/Documents/Pango_Design_Suite_Projects/project_shudian_wangjie/sim/behav
call "%bin_path%/modelsim"   -do "do {run_behav_compile.tcl};do {run_behav_simulate.tcl}" -l run_behav_simulate.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
