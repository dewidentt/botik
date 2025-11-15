param(
    [string]$GitUser = "",
    [string]$RepoName = "",
    [string]$Branch = "master"
)

if ($GitUser -eq "" -or $RepoName -eq "") {
    Write-Host "Error: provide parameters: -GitUser <YOUR_NICK> -RepoName <REPO_NAME>"
    exit
}

Write-Host "=== Initializing Git ==="
git init

Write-Host "=== Adding files ==="
git add .

Write-Host "=== Creating commit ==="
git commit -m "Initial commit"

$remoteUrl = "https://github.com/$GitUser/$RepoName.git"

Write-Host "=== Adding remote repository ==="
git remote add origin $remoteUrl

Write-Host "=== Pushing to GitHub ==="
git push -u origin $Branch

Write-Host "Done! Repository uploaded: $remoteUrl"
