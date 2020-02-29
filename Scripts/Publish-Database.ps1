$ProjectPath = [System.IO.Path]::GetFullPath("$PSScriptRoot\..\TestMusicAppDb.sqlproj");
$OrchestratorPath = "$PSScriptRoot\..\..\TestMusicAppLocalDeploymentOrchestrator";
$MSBuild = & "$OrchestratorPath\Utility\Find-MSBuildPath.ps1";
$ConnectionString = & "$OrchestratorPath\Database\Get-DatabaseConnectionString.ps1";
$DatabaseName = & "$OrchestratorPath\Database\Get-DatabaseName.ps1";

& $MSBuild $ProjectPath /t:reBuild,deploy /p:"TargetConnectionString=`"$ConnectionString`"" /p:TargetDatabase="$DatabaseName"