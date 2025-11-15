param(
    [string]$GitUser = "",
    [string]$RepoName = "",
    [string]$Branch = "main"
)

if ($GitUser -eq "" -or $RepoName -eq "") {
    Write-Host "Ошибка: укажи параметры: -GitUser <ТВОЙ_НИК> -RepoName <ИМЯ_РЕПО>"
    exit
}

Write-Host "=== Инициализация Git ==="
git init

Write-Host "=== Добавление файлов ==="
git add .

Write-Host "=== Создание коммита ==="
git commit -m "Initial commit"

$remoteUrl = "https://github.com/$GitUser/$RepoName.git"

Write-Host "=== Добавление удалённого репозитория ==="
git remote add origin $remoteUrl

Write-Host "=== Пуш в GitHub ==="
git push -u origin $Branch

Write-Host "Готово! Репозиторий загружен: $remoteUrl"
