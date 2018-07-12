:: Run the ssh agent, passing exit to kill a child cmd session
@CALL "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd" /K exit >NUL 2>&1

:: uncomment this next two lines to use pageant as the ssh authentication agent
:: SET SSH_AUTH_SOCK=/tmp/.ssh-pageant-auth-sock
:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-pageant.cmd"

:: you can add your plugins to the cmder path like so
:: set "PATH=%CMDER_ROOT%\vendor\whatever;%PATH%"

@ECHO OFF
@FOR %%f IN (%USERPROFILE%\.ssh\*_rsa) DO @(ssh-add %%f >NUL 2>&1)
