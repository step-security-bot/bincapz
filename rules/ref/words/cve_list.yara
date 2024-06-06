rule cve_list : medium {
	meta:
		description = "references a 'CVE List'"
	strings:
		$ref = /[a-zA-Z\-_ ]{0,16}cveList[a-zA-Z\-_ ]{0,16}/ fullword
		$ref2 = /[a-zA-Z\-_ ]{0,16}cve_list[a-zA-Z\-_ ]{0,16}/ fullword
	condition:
		any of them
}