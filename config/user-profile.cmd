REM Run the ssh agent, passing exit to kill a child cmd session
@call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd" /k exit >nul 2>&1

REM uncomment this next two lines to use pageant as the ssh authentication agent
REM set SSH_AUTH_SOCK=/tmp/.ssh-pageant-auth-sock
REM call "%GIT_INSTALL_ROOT%/cmd/start-ssh-pageant.cmd"

@echo off

REM Add ssh identities
@for %%f in ("%USERPROFILE%\.ssh\*_rsa") do @(ssh-add %%f >nul 2>&1)
