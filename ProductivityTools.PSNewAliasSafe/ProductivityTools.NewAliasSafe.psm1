<#
	My Function
#>
function New-AliasSafe {
	[cmdletbinding()]
	param([string]$Name, [string]$Value)
	
	$alias=Get-Alias $Name -ErrorAction Ignore
	if($alias -eq $null)
	{
		New-Alias -Name $Name -Value $Value -Scope Global
		Write-Verbose "Alias $Name set. It is pointing to $Value"
	}
	else
	{
		if ($alias.Definition -eq $Value)
		{
			Write-Verbose "Alias already setup"
		}
		else
		{
			throw "Alias $Name exists and it points to $($alias.Definition)"
		}
	}	
}

Export-ModuleMember New-AliasSafe