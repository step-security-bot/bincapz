rule bsd_libc {
	meta:
		syscall = "execve"
		pledge = "exec"
	strings:
		$execl = "execl" fullword
		$execle = "execle" fullword
		$execlp = "execlp" fullword
		$execv = "execv" fullword
		$execvp = "execvp" fullword
		$execvP = "execvP" fullword

		$go = "syscall.libc_execve_trampoline"
	condition:
		any of ($exec*) and not $go
}

rule syscall {
	meta:
		syscall = "execve"
		pledge = "exec"
	strings:
		$execve = "execve" fullword
		$go = "syscall.libc_execve_trampoline"
	condition:
		any of ($exec*) and not $go
}

rule go {
	meta:
		syscall = "execve"
		pledge = "exec"
	strings:
		$ref = "exec.(*Cmd).Run"
	condition:
		all of them
}


rule perl_php {
	meta:
		syscall = "execve"
		pledge = "exec"
	strings:
		$ref = "system(" fullword
	condition:
		all of them
}