$MaximumHistoryCount = 10KB

if (!(Test-Path ~\PowerShell -PathType Container))
{   New-Item ~\PowerShell -ItemType Directory
}

function bye 
{   Get-History -Count 1KB |Export-CSV ~\PowerShell\history.csv
    exit
}

if (Test-path ~\PowerShell\History.csv)
{   Import-CSV ~\PowerShell\History.csv |Add-History
}

# set aliases for git
function GitAddI
{
    git add -i
}
Set-Alias gitai GitAddI
function GitStatus
{
    git status
}
Set-Alias gits GitStatus

function GitCommitM ($Message)
{
    git commit -m $Message
}
Set-Alias gitcm GitCommitM
function GitCommitAM ($Message)
{
    git commit -am $Message
}
Set-Alias gitcam GitCommitAM

function GitPullPush ($Message)
{
	git pull
    git push
}
Set-Alias gitpp GitPullPush

function GitPfusch ($Message)
{
	$appendText = "; (fast commit)"
	git commit -am "$Message $appendText"
	git pull
    git push
}
Set-Alias git-pfusch GitPfusch

# other useful
function OpenServus ()
{
	Start-Process -FilePath "http://servusimbiss.at.st"
}
Set-Alias servus OpenServus

function OpenGoldegg ()
{
	Start-Process -FilePath "www.facebook.com/cafegoldegg"
}
Set-Alias goldegg OpenGoldegg
Set-Alias ge goldegg

# Load posh-git example profile
. 'D:\dev\Tools\posh-git\profile.example.ps1'

