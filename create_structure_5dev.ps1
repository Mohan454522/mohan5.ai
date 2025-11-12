# ===============================================================
#  Script: create_structure_5dev.ps1
#  Purpose: Create folder & file structure for CI Docker Project
#  Target: Existing folder "5.dev"
# ===============================================================

$basePath = "C:\Users\mohan\OneDrive\Desktop\5.dev"

if (!(Test-Path $basePath)) {
    Write-Host "❌ Folder '5.dev' not found at: $basePath" -ForegroundColor Red
    exit
}

Write-Host "✅ Using existing folder: $basePath" -ForegroundColor Cyan

# --- Create subfolders ---
$folders = @(
    "$basePath\tests",
    "$basePath\.github",
    "$basePath\.github\workflows"
)

foreach ($f in $folders) {
    if (!(Test-Path $f)) {
        New-Item -ItemType Directory -Force -Path $f | Out-Null
        Write-Host "📁 Created folder: $f"
    }
}

# --- Create empty files ---
$files = @(
    "$basePath\app.py",
    "$basePath\requirements.txt",
    "$basePath\Dockerfile",
    "$basePath\.gitignore",
    "$basePath\tests\__init__.py",
    "$basePath\tests\test_app.py",
    "$basePath\.github\workflows\ci-dockerhub.yml"
)

foreach ($file in $files) {
    if (!(Test-Path $file)) {
        New-Item -ItemType File -Force -Path $file | Out-Null
        Write-Host "📄 Created file: $file"
    }
}

Write-Host "`n✅ Project structure created successfully inside: $basePath" -ForegroundColor Green
Write-Host "`nResulting structure:"
Write-Host "├── app.py"
Write-Host "├── requirements.txt"
Write-Host "├── Dockerfile"
Write-Host "├── .gitignore"
Write-Host "├── tests/"
Write-Host "│   ├── __init__.py"
Write-Host "│   └── test_app.py"
Write-Host "└── .github/"
Write-Host "    └── workflows/"
Write-Host "        └── ci-dockerhub.yml"
