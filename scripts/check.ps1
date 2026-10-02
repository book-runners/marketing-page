<#
scripts/check.ps1: Windows PowerShell entry for scripts/check (same arguments):

  scripts\check.ps1                      push-tier static checks
  scripts\check.ps1 tests/test_x.py      focused tests
  scripts\check.ps1 --dry-run            print what would be pushed and dispatched

It runs scripts/check with the bash that ships with Git for Windows (never WSL),
so it needs only git and the GitHub CLI. The exit code is the check's.
#>
$ErrorActionPreference = 'Stop'
$git = (Get-Command git -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1).Source
if (-not $git) { [Console]::Error.WriteLine('check: install Git for Windows.'); exit 2 }
# git.exe lives in <Git>\cmd, <Git>\bin or <Git>\mingw64\bin; bash.exe in <Git>\bin.
$dir = Split-Path $git
$bash = @((Join-Path (Split-Path $dir) 'bin\bash.exe'), (Join-Path $dir 'bash.exe'),
    (Join-Path (Split-Path (Split-Path $dir)) 'bin\bash.exe')) |
    Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $bash) { [Console]::Error.WriteLine("check: no Git for Windows bash.exe near $git."); exit 2 }
& $bash (($PSScriptRoot -replace '\\', '/') + '/check') @args
exit $LASTEXITCODE
