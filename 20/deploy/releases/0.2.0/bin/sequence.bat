:: Discover the current release directory from the directory
:: of this script and the start_erl.data file
@set script_dir=%~dp0
@for %%A in ("%script_dir%\..") do @(
  set release_root_dir=%%~fA
)
@set rel_name=sequence
@set rel_vsn=0.2.0
@set boot_script=%release_root_dir%\releases\%rel_vsn%\%rel_name%.bat
@%boot_script% %*