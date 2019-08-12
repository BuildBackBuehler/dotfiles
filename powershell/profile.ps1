if (test-path alias:gc) { remove-item -force alias:gc }
if (test-path alias:gl) { remove-item -force alias:gl }
if (test-path alias:gp) { remove-item -force alias:gp }

set-alias -name vi -value nvim

function ga { git add $args }
function gb { git branch $args }
function gba { git branch -a $args }
function gc { git commit $args }
function gca { git commit -a $args }
function gco { git checkout $args }
function gd { git diff $args }
function gf { git fetch $args }
function gfpr {
    $id = $args[0]
    git fetch -fu origin refs/pull/$id/head:pr/$id
    git checkout pr/$id
}
function gid { git rev-parse HEAD }
function gl { git log --graph --abbrev-commit --date-order --format=format:'%Cblue%h%Creset%C(bold red)%d%Creset %s <%an> %Cgreen(%ar)%Creset' --all $args }
function glb { git log --graph --abbrev-commit --date-order --format=format:'%Cblue%h%Creset%C(bold red)%d%Creset %s <%an> %Cgreen(%ar)%Creset' $args }
function gp { git pull $args }
function gri { git rebase -i  $args }
function grv { git remote -v }
function gs { git status --short $args }
function which { get-command $args }

$scoopPath = $env:USERPROFILE + '\scoop\shims'
$cleanedPath = ($env:PATH.split(';')) -notmatch ($scoopPath -replace '\\', '\\')
$env:PATH = (@($scoopPath) + $cleanedPath) -join ';'
$env:GIT_SSH = (scoop which ssh) 

import-module ~\scoop\modules\posh-git
