$identity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()

return $identity.isInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
