$RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

$SystemUsesLightThemeKey = @{
	Key   = 'SystemUsesLightTheme';
	Type  = "DWORD";
	Value = '0x00000000'
}

If ($Null -eq (Get-ItemProperty -Path $RegPath -Name $SystemUsesLightThemeKey.Key -ErrorAction SilentlyContinue))
{
	New-ItemProperty -Path $RegPath -Name $SystemUsesLightThemeKey.Key -Value $SystemUsesLightThemeKey.Value -PropertyType $SystemUsesLightThemeKey.Type -Force
}
Else
{
	Set-ItemProperty -Path $RegPath -Name $SystemUsesLightThemeKey.Key -Value $SystemUsesLightThemeKey.Value -Force
}

$AppsUseLightThemeKey = @{
	Key   = 'AppsUseLightTheme';
	Type  = "DWORD";
	Value = '0x00000000'
}

If ($Null -eq (Get-ItemProperty -Path $RegPath -Name $AppsUseLightThemeKey.Key -ErrorAction SilentlyContinue))
{
	New-ItemProperty -Path $RegPath -Name $AppsUseLightThemeKey.Key -Value $AppsUseLightThemeKey.Value -PropertyType $AppsUseLightThemeKey.Type -Force
}
Else
{
	Set-ItemProperty -Path $RegPath -Name $AppsUseLightThemeKey.Key -Value $AppsUseLightThemeKey.Value -Force
}

Stop-Process -ProcessName explorer -Force -ErrorAction SilentlyContinue