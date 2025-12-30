<#
  Script: PrivEsc.ps1
  Author: 47Com1c
  Usage: Run as Administrator, Or Just Create User and Add to it Administrator manually
#>


### IF you want to run this script, Make sure to enable your Set-ExecutionPolicy on Powershell

Write-Host "[+] Generating test events for Wazuh SIEM..." -ForegroundColor Cyan

$testUser = "wazuh_test"
$testPass = "P@ssw0rd!"

Write-Host "[*] Creating local test user..." -ForegroundColor Yellow
net user $testUser $testPass /add

Write-Host "[*] Adding user to Administrators group..." -ForegroundColor Yellow
net localgroup administrators $testUser /add

Write-Host "[*] Cleanup: removing test user..." -ForegroundColor Yellow
net user $testUser /delete

Write-Host "[+] Test events generated successfully." -ForegroundColor Green
