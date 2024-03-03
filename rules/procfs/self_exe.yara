
rule proc_self_exe : notable {
	meta:
		description = "gets executable associated to this process"
		pledge = "stdio"
	strings:
		$ref = "/proc/self/exe" fullword
	condition:
		any of them
}
