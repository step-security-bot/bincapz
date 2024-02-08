rule bsd_libc : harmless {
	meta:
		description = "Uses libc functions to list a directory"
		pledge = "rpath"
	strings:
		$opendir = "opendir" fullword
		$readdir = "_readdir" fullword
		$fdopendir = "fdopendir" fullword
		$taildir = "taildir" fullword
		$seekdir = "seekdir" fullword
		$rewinddir = "rewinddir" fullword
	condition:
		any of them
}

rule go {
	meta:
		description = "Uses Go functions to list a directory"
		pledge = "rpath"
	strings:
		$OpenDir = ".OpenDir" fullword
		$ReadDir = ".ReadDir" fullword
	condition:
		any of them
}

rule bin_ls {
	meta:
		description = "Uses /bin/ls list a directory"
		pledge = "rpath"
	strings:
		$ref = "/bin/ls"
	condition:
		any of them
}