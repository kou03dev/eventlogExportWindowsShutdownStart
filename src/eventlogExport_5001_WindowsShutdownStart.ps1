Get-WinEvent -FilterHashtable @{
  LogName='System'
  StartTime=(Get-Date).AddDays(-7)
} | ` 
Where {$_.Message -match "オペレーティング システムは.*に(起動|シャット ダウン)しま" } | ` 
ForEach-Object {
  $_.Message = ( $_.Message -replace "[\r\n]","\<br\>")
  $_ } | Export-Csv -Path ( Join-Path -Path "$env:userprofile" -ChildPath "Documents\eventlogexport_5001_WindowsShutdownStart.tsv" ) -Delimiter "`t" -Encoding UTF8 -NoTypeInformation
