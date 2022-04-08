@echo off

for /d %%i in (SAM*) do (
  pushd %%i
  echo cleaning %%i
  git clean -dfX
  popd
)
