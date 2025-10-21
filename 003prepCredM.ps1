# git remote -v

# 14:40:46.432969 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/bin
# 14:40:46.456232 git.c:502               trace: built-in: git remote -v
# origin  https://github.com/Skills-Inc-Org/IT_TeamProject.git (fetch)
# origin  https://github.com/Skills-Inc-Org/IT_TeamProject.git (push)

# git fetch origin -v


# 14:44:04.140634 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/bin
# 14:44:04.182687 git.c:502               trace: built-in: git fetch origin -v
# 14:44:04.195720 run-command.c:674       trace: run_command: GIT_DIR=.git git remote-https origin https://github.com/Skills-Inc-Org/IT_TeamProject.git
# 14:44:04.195720 run-command.c:935       trace: start_command: git remote-https origin https://github.com/Skills-Inc-Org/IT_TeamProject.git
# 14:44:04.229673 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:04.251640 git.c:807               trace: exec: git-remote-https origin https://github.com/Skills-Inc-Org/IT_TeamProject.git
# 14:44:04.251841 run-command.c:674       trace: run_command: git-remote-https origin https://github.com/Skills-Inc-Org/IT_TeamProject.git
# 14:44:04.251841 run-command.c:935       trace: start_command: git-remote-https origin https://github.com/Skills-Inc-Org/IT_TeamProject.git
# 14:44:04.289456 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:04.347232 http.c:915              == Info: Couldn't find host github.com in the .netrc file; using defaults
# 14:44:05.477388 http.c:915              == Info: Host github.com:443 was resolved.
# 14:44:05.477388 http.c:915              == Info: IPv6: (none)
# 14:44:05.477388 http.c:915              == Info: IPv4: 140.82.113.3
# 14:44:05.477388 http.c:915              == Info:   Trying 140.82.113.3:443...
# 14:44:05.482389 http.c:915              == Info: ALPN: curl offers h2,http/1.1
# 14:44:05.482389 http.c:915              == Info: TLSv1.3 (OUT), TLS handshake, Client hello (1):
# 14:44:05.494900 http.c:915              == Info:  CAfile: C:/Program Files/Git/mingw64/etc/ssl/certs/ca-bundle.crt
# 14:44:05.494900 http.c:915              == Info:  CApath: none
# 14:44:05.628800 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, Server hello (2):
# 14:44:05.629814 http.c:915              == Info: TLSv1.3 (IN), TLS change cipher, Change cipher spec (1):
# 14:44:05.629814 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
# 14:44:05.629814 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, Certificate (11):
# 14:44:05.630844 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, CERT verify (15):
# 14:44:05.631827 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, Finished (20):
# 14:44:05.631827 http.c:915              == Info: TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
# 14:44:05.631827 http.c:915              == Info: TLSv1.3 (OUT), TLS handshake, Finished (20):
# 14:44:05.631827 http.c:915              == Info: SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256 / x25519 / id-ecPublicKey
# 14:44:05.631827 http.c:915              == Info: ALPN: server accepted h2
# 14:44:05.631827 http.c:915              == Info: Server certificate:
# 14:44:05.631827 http.c:915              == Info:  subject: CN=github.com
# 14:44:05.631827 http.c:915              == Info:  start date: Feb  5 00:00:00 2025 GMT
# 14:44:05.631827 http.c:915              == Info:  expire date: Feb  5 23:59:59 2026 GMT
# 14:44:05.631827 http.c:915              == Info:  subjectAltName: host "github.com" matched cert's "github.com"
# 14:44:05.632812 http.c:915              == Info:  issuer: C=GB; ST=Greater Manchester; L=Salford; O=Sectigo Limited; CN=Sectigo ECC Domain Validation Secure Server CA
# 14:44:05.632812 http.c:915              == Info:  SSL certificate verify ok.
# 14:44:05.632812 http.c:915              == Info:   Certificate level 0: Public key type EC/prime256v1 (256/128 Bits/secBits), signed using ecdsa-with-SHA256
# 14:44:05.632812 http.c:915              == Info:   Certificate level 1: Public key type EC/prime256v1 (256/128 Bits/secBits), signed using ecdsa-with-SHA384
# 14:44:05.632812 http.c:915              == Info:   Certificate level 2: Public key type EC/secp384r1 (384/192 Bits/secBits), signed using ecdsa-with-SHA384
# 14:44:05.632812 http.c:915              == Info: Established connection to github.com (140.82.113.3 port 443) from 192.168.101.164 port 57227
# 14:44:05.632812 http.c:915              == Info: using HTTP/2
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] OPENED stream for https://github.com/Skills-Inc-Org/IT_TeamProject.git/info/refs?service=git-upload-pack
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [:method: GET]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [:scheme: https]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [:authority: github.com]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [:path: /Skills-Inc-Org/IT_TeamProject.git/info/refs?service=git-upload-pack]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [user-agent: git/2.51.1.windows.1]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [accept: */*]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [accept-encoding: deflate, gzip, br, zstd]
# 14:44:05.632812 http.c:915              == Info: [HTTP/2] [1] [pragma: no-cache]
# 14:44:05.633878 http.c:915              == Info: [HTTP/2] [1] [git-protocol: version=2]
# 14:44:05.633878 http.c:862              => Send header, 0000000233 bytes (0x000000e9)
# 14:44:05.633878 http.c:874              => Send header: GET /Skills-Inc-Org/IT_TeamProject.git/info/refs?service=git-upload-pack HTTP/2
# 14:44:05.633878 http.c:874              => Send header: Host: github.com
# 14:44:05.633878 http.c:874              => Send header: User-Agent: git/2.51.1.windows.1
# 14:44:05.633878 http.c:874              => Send header: Accept: */*
# 14:44:05.633878 http.c:874              => Send header: Accept-Encoding: deflate, gzip, br, zstd
# 14:44:05.633878 http.c:874              => Send header: Pragma: no-cache
# 14:44:05.633878 http.c:874              => Send header: Git-Protocol: version=2
# 14:44:05.633878 http.c:874              => Send header:
# 14:44:05.633878 http.c:915              == Info: Request completely sent off
# 14:44:05.703968 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
# 14:44:05.704478 http.c:915              == Info: TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
# 14:44:05.798347 http.c:862              <= Recv header, 0000000013 bytes (0x0000000d)
# 14:44:05.798347 http.c:874              <= Recv header: HTTP/2 401
# 14:44:05.798347 http.c:862              <= Recv header, 0000000026 bytes (0x0000001a)
# 14:44:05.798347 http.c:874              <= Recv header: server: GitHub-Babel/3.0
# 14:44:05.799148 http.c:862              <= Recv header, 0000000054 bytes (0x00000036)
# 14:44:05.799148 http.c:874              <= Recv header: content-security-policy: default-src 'none'; sandbox
# 14:44:05.799148 http.c:862              <= Recv header, 0000000041 bytes (0x00000029)
# 14:44:05.799148 http.c:874              <= Recv header: content-type: text/plain; charset=UTF-8
# 14:44:05.799148 http.c:862              <= Recv header, 0000000040 bytes (0x00000028)
# 14:44:05.799148 http.c:874              <= Recv header: www-authenticate: Basic realm="GitHub"
# 14:44:05.799148 http.c:862              <= Recv header, 0000000020 bytes (0x00000014)
# 14:44:05.799148 http.c:874              <= Recv header: content-length: 21
# 14:44:05.799148 http.c:862              <= Recv header, 0000000037 bytes (0x00000025)
# 14:44:05.800185 http.c:874              <= Recv header: date: Tue, 21 Oct 2025 21:44:05 GMT
# 14:44:05.800185 http.c:862              <= Recv header, 0000000057 bytes (0x00000039)
# 14:44:05.800185 http.c:874              <= Recv header: x-github-request-id: DF8B:2541B9:152F9E:1B2092:68F7FEA5
# 14:44:05.800185 http.c:862              <= Recv header, 0000000023 bytes (0x00000017)
# 14:44:05.800185 http.c:874              <= Recv header: x-frame-options: DENY
# 14:44:05.800185 http.c:862              <= Recv header, 0000000073 bytes (0x00000049)
# 14:44:05.800185 http.c:874              <= Recv header: strict-transport-security: max-age=31536000; includeSubDomains; preload
# 14:44:05.800185 http.c:862              <= Recv header, 0000000002 bytes (0x00000002)
# 14:44:05.800185 http.c:874              <= Recv header:
# 14:44:05.800185 http.c:915              == Info: Connection #0 to host github.com:443 left intact
# 14:44:05.801183 run-command.c:674       trace: run_command: 'git credential-manager get'
# 14:44:05.801183 run-command.c:935       trace: start_command: 'C:/Program Files/Git/usr/bin/sh.exe' -c 'git credential-manager get' 'git credential-manager get'
# 14:44:05.926166 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:05.946759 git.c:807               trace: exec: git-credential-manager get
# 14:44:05.947783 run-command.c:674       trace: run_command: git-credential-manager get
# 14:44:05.947783 run-command.c:935       trace: start_command: git-credential-manager get
# 14:44:06.112351 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:06.142491 git.c:502               trace: built-in: git config --null --list
# 14:44:06.262968 ...\Application.cs:106  trace: [RunInternalAsync] Version: 2.6.1.0
# 14:44:06.263968 ...\Application.cs:107  trace: [RunInternalAsync] Runtime: .NET Framework 4.8.9221.0
# 14:44:06.263968 ...\Application.cs:108  trace: [RunInternalAsync] Platform: Windows (x86-64)
# 14:44:06.263968 ...\Application.cs:109  trace: [RunInternalAsync] OSVersion: 10.0 (build 26220)
# 14:44:06.263968 ...\Application.cs:110  trace: [RunInternalAsync] AppPath: C:\Program Files\Git\mingw64\bin\git-credential-manager.exe
# 14:44:06.264937 ...\Application.cs:111  trace: [RunInternalAsync] InstallDir: C:\Program Files\Git\mingw64\bin\
# 14:44:06.264937 ...\Application.cs:112  trace: [RunInternalAsync] Arguments: get
# 14:44:06.306834 ...GitCommandBase.cs:32 trace: [ExecuteAsync] Start 'get' command...
# 14:44:06.319383 ...GitCommandBase.cs:46 trace: [ExecuteAsync] Detecting host provider for input:
# 14:44:06.321386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   capability[]=authtype
# 14:44:06.321386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   capability[]=state
# 14:44:06.321386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   protocol=https
# 14:44:06.321386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   host=github.com
# 14:44:06.321386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   wwwauth=Basic realm="GitHub"
# 14:44:06.326634 ...viderRegistry.cs:149 trace: [GetProviderAsync] Performing auto-detection of host provider.
# 14:44:06.326634 ...viderRegistry.cs:162 trace: [GetProviderAsync] Auto-detect probe timeout is 2 ms.
# 14:44:06.328636 ...viderRegistry.cs:170 trace: [GetProviderAsync] Checking against 4 host providers registered with priority 'Normal'.
# 14:44:06.330635 ...GitCommandBase.cs:49 trace: [ExecuteAsync] Host provider 'GitHub' was selected.
# 14:44:06.340208 ...bHostProvider.cs:142 trace: [GetCredentialAsync] Found 1 accounts in the store for service=https://github.com:
# 14:44:06.340208 ...bHostProvider.cs:145 trace: [GetCredentialAsync]   wmthompson1-skills
# 14:44:06.341715 ...bHostProvider.cs:218 trace: [FilterAccounts] Account filtering is enabled.
# 14:44:06.346379 ...bHostProvider.cs:226 trace: [FilterAccounts] Filtering based on WWW-Authenticate header information...
# 14:44:06.347390 ...bHostProvider.cs:229 trace: [FilterAccounts] Matched 1 accounts with public domain:
# 14:44:06.347390 ...bHostProvider.cs:234 trace: [FilterAccounts]   wmthompson1-skills
# 14:44:06.348389 ...bHostProvider.cs:153 trace: [GetCredentialAsync] Only one account available - using that one!
# 14:44:06.348389 ...bHostProvider.cs:175 trace: [GetCredentialAsync] Looking for existing credential in store with service=https://github.com account=wmthompson1-skills...
# 14:44:06.349388 ...bHostProvider.cs:190 trace: [GetCredentialAsync] Existing credential found.
# 14:44:06.349388 ...\GetCommand.cs:39    trace: [ExecuteInternalAsync] Writing credentials to output:
# 14:44:06.349388 ...\GetCommand.cs:40    trace: [ExecuteInternalAsync]   protocol=https
# 14:44:06.350386 ...\GetCommand.cs:40    trace: [ExecuteInternalAsync]   host=github.com
# 14:44:06.350386 ...\GetCommand.cs:40    trace: [ExecuteInternalAsync]   username=wmthompson1-skills
# 14:44:06.350386 ...\GetCommand.cs:40    trace: [ExecuteInternalAsync]   password=********
# 14:44:06.351386 ...GitCommandBase.cs:53 trace: [ExecuteAsync] End 'get' command...
# 14:44:06.371130 http.c:915              == Info: Reusing existing https: connection with host github.com
# 14:44:06.371130 http.c:915              == Info: Server auth using Basic with user 'wmthompson1-skills'
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] OPENED stream for https://github.com/Skills-Inc-Org/IT_TeamProject.git/info/refs?service=git-upload-pack
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [:method: GET]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [:scheme: https]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [:authority: github.com]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [:path: /Skills-Inc-Org/IT_TeamProject.git/info/refs?service=git-upload-pack]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [authorization: Basic <redacted>]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [user-agent: git/2.51.1.windows.1]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [accept: */*]
# 14:44:06.371130 http.c:915              == Info: [HTTP/2] [3] [accept-encoding: deflate, gzip, br, zstd]
# 14:44:06.372133 http.c:915              == Info: [HTTP/2] [3] [pragma: no-cache]
# 14:44:06.372133 http.c:915              == Info: [HTTP/2] [3] [git-protocol: version=2]
# 14:44:06.372133 http.c:862              => Send header, 0000000336 bytes (0x00000150)
# 14:44:06.372133 http.c:874              => Send header: GET /Skills-Inc-Org/IT_TeamProject.git/info/refs?service=git-upload-pack HTTP/2
# 14:44:06.372133 http.c:874              => Send header: Host: github.com
# 14:44:06.372133 http.c:874              => Send header: Authorization: Basic <redacted>
# 14:44:06.372133 http.c:874              => Send header: User-Agent: git/2.51.1.windows.1
# 14:44:06.372133 http.c:874              => Send header: Accept: */*
# 14:44:06.372133 http.c:874              => Send header: Accept-Encoding: deflate, gzip, br, zstd
# 14:44:06.372133 http.c:874              => Send header: Pragma: no-cache
# 14:44:06.372133 http.c:874              => Send header: Git-Protocol: version=2
# 14:44:06.372133 http.c:874              => Send header:
# 14:44:06.372133 http.c:915              == Info: Request completely sent off
# 14:44:06.499474 http.c:862              <= Recv header, 0000000013 bytes (0x0000000d)
# 14:44:06.499474 http.c:874              <= Recv header: HTTP/2 200
# 14:44:06.499474 http.c:862              <= Recv header, 0000000026 bytes (0x0000001a)
# 14:44:06.499474 http.c:874              <= Recv header: server: GitHub-Babel/3.0
# 14:44:06.500269 http.c:862              <= Recv header, 0000000059 bytes (0x0000003b)
# 14:44:06.500269 http.c:874              <= Recv header: content-type: application/x-git-upload-pack-advertisement
# 14:44:06.500269 http.c:862              <= Recv header, 0000000054 bytes (0x00000036)
# 14:44:06.500269 http.c:874              <= Recv header: content-security-policy: default-src 'none'; sandbox
# 14:44:06.500269 http.c:862              <= Recv header, 0000000040 bytes (0x00000028)
# 14:44:06.500269 http.c:874              <= Recv header: expires: Fri, 01 Jan 1980 00:00:00 GMT
# 14:44:06.500269 http.c:862              <= Recv header, 0000000018 bytes (0x00000012)
# 14:44:06.500269 http.c:874              <= Recv header: pragma: no-cache
# 14:44:06.501263 http.c:862              <= Recv header, 0000000053 bytes (0x00000035)
# 14:44:06.501263 http.c:874              <= Recv header: cache-control: no-cache, max-age=0, must-revalidate
# 14:44:06.501263 http.c:862              <= Recv header, 0000000023 bytes (0x00000017)
# 14:44:06.501263 http.c:874              <= Recv header: vary: Accept-Encoding
# 14:44:06.501263 http.c:862              <= Recv header, 0000000037 bytes (0x00000025)
# 14:44:06.501263 http.c:874              <= Recv header: date: Tue, 21 Oct 2025 21:44:06 GMT
# 14:44:06.501263 http.c:862              <= Recv header, 0000000057 bytes (0x00000039)
# 14:44:06.501263 http.c:874              <= Recv header: x-github-request-id: DF8B:2541B9:1532AF:1B246C:68F7FEA5
# 14:44:06.501263 http.c:862              <= Recv header, 0000000023 bytes (0x00000017)
# 14:44:06.501263 http.c:874              <= Recv header: x-frame-options: DENY
# 14:44:06.501263 http.c:862              <= Recv header, 0000000073 bytes (0x00000049)
# 14:44:06.501263 http.c:874              <= Recv header: strict-transport-security: max-age=31536000; includeSubDomains; preload
# 14:44:06.502261 http.c:862              <= Recv header, 0000000002 bytes (0x00000002)
# 14:44:06.502261 http.c:874              <= Recv header:
# 14:44:06.502261 http.c:915              == Info: Connection #0 to host github.com:443 left intact
# 14:44:06.502261 run-command.c:674       trace: run_command: 'git credential-manager store'
# 14:44:06.502261 run-command.c:935       trace: start_command: 'C:/Program Files/Git/usr/bin/sh.exe' -c 'git credential-manager store' 'git credential-manager store'
# 14:44:06.617927 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:06.637994 git.c:807               trace: exec: git-credential-manager store
# 14:44:06.637994 run-command.c:674       trace: run_command: git-credential-manager store
# 14:44:06.637994 run-command.c:935       trace: start_command: git-credential-manager store
# 14:44:06.790060 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:06.810271 git.c:502               trace: built-in: git config --null --list
# 14:44:06.895581 ...\Application.cs:106  trace: [RunInternalAsync] Version: 2.6.1.0
# 14:44:06.896973 ...\Application.cs:107  trace: [RunInternalAsync] Runtime: .NET Framework 4.8.9221.0
# 14:44:06.896973 ...\Application.cs:108  trace: [RunInternalAsync] Platform: Windows (x86-64)
# 14:44:06.896973 ...\Application.cs:109  trace: [RunInternalAsync] OSVersion: 10.0 (build 26220)
# 14:44:06.896973 ...\Application.cs:110  trace: [RunInternalAsync] AppPath: C:\Program Files\Git\mingw64\bin\git-credential-manager.exe
# 14:44:06.897980 ...\Application.cs:111  trace: [RunInternalAsync] InstallDir: C:\Program Files\Git\mingw64\bin\
# 14:44:06.897980 ...\Application.cs:112  trace: [RunInternalAsync] Arguments: store
# 14:44:06.938036 ...GitCommandBase.cs:32 trace: [ExecuteAsync] Start 'store' command...
# 14:44:06.951089 ...GitCommandBase.cs:46 trace: [ExecuteAsync] Detecting host provider for input:
# 14:44:06.953095 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   protocol=https
# 14:44:06.953095 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   host=github.com
# 14:44:06.953095 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   username=wmthompson1-skills
# 14:44:06.953095 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   password=********
# 14:44:06.957102 ...viderRegistry.cs:149 trace: [GetProviderAsync] Performing auto-detection of host provider.
# 14:44:06.958100 ...viderRegistry.cs:162 trace: [GetProviderAsync] Auto-detect probe timeout is 2 ms.
# 14:44:06.960098 ...viderRegistry.cs:170 trace: [GetProviderAsync] Checking against 4 host providers registered with priority 'Normal'.
# 14:44:06.962623 ...GitCommandBase.cs:49 trace: [ExecuteAsync] Host provider 'GitHub' was selected.
# 14:44:06.962623 ...bHostProvider.cs:257 trace: [StoreCredentialAsync] Storing credential with service=https://github.com account=wmthompson1-skills...
# 14:44:06.966619 ...bHostProvider.cs:259 trace: [StoreCredentialAsync] Credential was successfully stored.
# 14:44:06.967615 ...GitCommandBase.cs:53 trace: [ExecuteAsync] End 'store' command...
# 14:44:06.985763 run-command.c:674       trace: run_command: 'git credential-manager store'
# 14:44:06.985763 run-command.c:935       trace: start_command: 'C:/Program Files/Git/usr/bin/sh.exe' -c 'git credential-manager store' 'git credential-manager store'
# 14:44:07.102843 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:07.123445 git.c:807               trace: exec: git-credential-manager store
# 14:44:07.123445 run-command.c:674       trace: run_command: git-credential-manager store
# 14:44:07.123445 run-command.c:935       trace: start_command: git-credential-manager store
# 14:44:07.272991 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:07.292279 git.c:502               trace: built-in: git config --null --list
# 14:44:07.375492 ...\Application.cs:106  trace: [RunInternalAsync] Version: 2.6.1.0
# 14:44:07.376794 ...\Application.cs:107  trace: [RunInternalAsync] Runtime: .NET Framework 4.8.9221.0
# 14:44:07.376794 ...\Application.cs:108  trace: [RunInternalAsync] Platform: Windows (x86-64)
# 14:44:07.376794 ...\Application.cs:109  trace: [RunInternalAsync] OSVersion: 10.0 (build 26220)
# 14:44:07.376794 ...\Application.cs:110  trace: [RunInternalAsync] AppPath: C:\Program Files\Git\mingw64\bin\git-credential-manager.exe
# 14:44:07.377804 ...\Application.cs:111  trace: [RunInternalAsync] InstallDir: C:\Program Files\Git\mingw64\bin\
# 14:44:07.378154 ...\Application.cs:112  trace: [RunInternalAsync] Arguments: store
# 14:44:07.419893 ...GitCommandBase.cs:32 trace: [ExecuteAsync] Start 'store' command...
# 14:44:07.432384 ...GitCommandBase.cs:46 trace: [ExecuteAsync] Detecting host provider for input:
# 14:44:07.433386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   protocol=https
# 14:44:07.433386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   host=github.com
# 14:44:07.433386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   username=wmthompson1-skills
# 14:44:07.433386 ...GitCommandBase.cs:47 trace: [ExecuteAsync]   password=********
# 14:44:07.437409 ...viderRegistry.cs:149 trace: [GetProviderAsync] Performing auto-detection of host provider.
# 14:44:07.438426 ...viderRegistry.cs:162 trace: [GetProviderAsync] Auto-detect probe timeout is 2 ms.
# 14:44:07.439435 ...viderRegistry.cs:170 trace: [GetProviderAsync] Checking against 4 host providers registered with priority 'Normal'.
# 14:44:07.440941 ...GitCommandBase.cs:49 trace: [ExecuteAsync] Host provider 'GitHub' was selected.
# 14:44:07.441983 ...bHostProvider.cs:257 trace: [StoreCredentialAsync] Storing credential with service=https://github.com account=wmthompson1-skills...
# 14:44:07.445946 ...bHostProvider.cs:259 trace: [StoreCredentialAsync] Credential was successfully stored.
# 14:44:07.447043 ...GitCommandBase.cs:53 trace: [ExecuteAsync] End 'store' command...
# POST git-upload-pack (224 bytes)
# 14:44:07.465198 http.c:915              == Info: Reusing existing https: connection with host github.com
# 14:44:07.465198 http.c:915              == Info: Server auth using Basic with user 'wmthompson1-skills'
# 14:44:07.465198 http.c:915              == Info: [HTTP/2] [5] OPENED stream for https://github.com/Skills-Inc-Org/IT_TeamProject.git/git-upload-pack
# 14:44:07.465198 http.c:915              == Info: [HTTP/2] [5] [:method: POST]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [:scheme: https]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [:authority: github.com]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [:path: /Skills-Inc-Org/IT_TeamProject.git/git-upload-pack]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [authorization: Basic <redacted>]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [user-agent: git/2.51.1.windows.1]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [accept-encoding: deflate, gzip, br, zstd]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [content-type: application/x-git-upload-pack-request]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [accept: application/x-git-upload-pack-result]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [git-protocol: version=2]
# 14:44:07.466205 http.c:915              == Info: [HTTP/2] [5] [content-length: 224]
# 14:44:07.466205 http.c:862              => Send header, 0000000408 bytes (0x00000198)
# 14:44:07.466205 http.c:874              => Send header: POST /Skills-Inc-Org/IT_TeamProject.git/git-upload-pack HTTP/2
# 14:44:07.466205 http.c:874              => Send header: Host: github.com
# 14:44:07.467205 http.c:874              => Send header: Authorization: Basic <redacted>
# 14:44:07.467205 http.c:874              => Send header: User-Agent: git/2.51.1.windows.1
# 14:44:07.467205 http.c:874              => Send header: Accept-Encoding: deflate, gzip, br, zstd
# 14:44:07.467205 http.c:874              => Send header: Content-Type: application/x-git-upload-pack-request
# 14:44:07.467205 http.c:874              => Send header: Accept: application/x-git-upload-pack-result
# 14:44:07.467205 http.c:874              => Send header: Git-Protocol: version=2
# 14:44:07.467205 http.c:874              => Send header: Content-Length: 224
# 14:44:07.467205 http.c:874              => Send header:
# 14:44:07.467205 http.c:915              == Info: upload completely sent off: 224 bytes
# 14:44:07.593518 http.c:862              <= Recv header, 0000000013 bytes (0x0000000d)
# 14:44:07.593518 http.c:874              <= Recv header: HTTP/2 200
# 14:44:07.593518 http.c:862              <= Recv header, 0000000026 bytes (0x0000001a)
# 14:44:07.593518 http.c:874              <= Recv header: server: GitHub-Babel/3.0
# 14:44:07.593518 http.c:862              <= Recv header, 0000000052 bytes (0x00000034)
# 14:44:07.594375 http.c:874              <= Recv header: content-type: application/x-git-upload-pack-result
# 14:44:07.594375 http.c:862              <= Recv header, 0000000054 bytes (0x00000036)
# 14:44:07.594375 http.c:874              <= Recv header: content-security-policy: default-src 'none'; sandbox
# 14:44:07.594375 http.c:862              <= Recv header, 0000000040 bytes (0x00000028)
# 14:44:07.594375 http.c:874              <= Recv header: expires: Fri, 01 Jan 1980 00:00:00 GMT
# 14:44:07.594375 http.c:862              <= Recv header, 0000000018 bytes (0x00000012)
# 14:44:07.594375 http.c:874              <= Recv header: pragma: no-cache
# 14:44:07.594375 http.c:862              <= Recv header, 0000000053 bytes (0x00000035)
# 14:44:07.595370 http.c:874              <= Recv header: cache-control: no-cache, max-age=0, must-revalidate
# 14:44:07.595370 http.c:862              <= Recv header, 0000000023 bytes (0x00000017)
# 14:44:07.595370 http.c:874              <= Recv header: vary: Accept-Encoding
# 14:44:07.595370 http.c:862              <= Recv header, 0000000037 bytes (0x00000025)
# 14:44:07.595370 http.c:874              <= Recv header: date: Tue, 21 Oct 2025 21:44:07 GMT
# 14:44:07.595370 http.c:862              <= Recv header, 0000000057 bytes (0x00000039)
# 14:44:07.595370 http.c:874              <= Recv header: x-github-request-id: DF8B:2541B9:153780:1B2A81:68F7FEA6
# 14:44:07.595370 http.c:862              <= Recv header, 0000000023 bytes (0x00000017)
# 14:44:07.595370 http.c:874              <= Recv header: x-frame-options: DENY
# 14:44:07.595370 http.c:862              <= Recv header, 0000000073 bytes (0x00000049)
# 14:44:07.595370 http.c:874              <= Recv header: strict-transport-security: max-age=31536000; includeSubDomains; preload
# 14:44:07.595370 http.c:862              <= Recv header, 0000000002 bytes (0x00000002)
# 14:44:07.596368 http.c:874              <= Recv header:
# 14:44:07.596368 http.c:915              == Info: Connection #0 to host github.com:443 left intact
# 14:44:07.599744 run-command.c:674       trace: run_command: git rev-list --objects --stdin --not --exclude-hidden=fetch --all --quiet --alternate-refs
# 14:44:07.599744 run-command.c:935       trace: start_command: git rev-list --objects --stdin --not --exclude-hidden=fetch --all --quiet --alternate-refs
# From https://github.com/Skills-Inc-Org/IT_TeamProject
#  = [up to date]      main       -> origin/main
# 14:44:07.692600 run-command.c:1541      run_processes_parallel: preparing to run up to 1 tasks
# 14:44:07.692600 run-command.c:1569      run_processes_parallel: done
# 14:44:07.692600 run-command.c:674       trace: run_command: git maintenance run --auto --no-quiet --detach
# 14:44:07.692600 run-command.c:935       trace: start_command: git maintenance run --auto --no-quiet --detach
# 14:44:07.722857 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/libexec/git-core
# 14:44:07.748037 git.c:502               trace: built-in: git maintenance run --auto --no-quiet --detach

# git status

# 14:47:17.603565 exec-cmd.c:266          trace: resolved executable dir: C:/Program Files/Git/mingw64/bin
# 14:47:17.626725 git.c:502               trace: built-in: git status
# On branch main
# Your branch is up to date with 'origin/main'.

# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#         000Inspect.ps1
#         001prepCredM.ps1
#         002prepCredM.ps1
#         003prepCredM.ps1
#         201CredsConfig.ps1

# nothing added to commit but untracked files present (use "git add" to track)

# get a list of stored credentials  

git-credential-manager.exe get | Out-Null

my manager has unlimited prompts for my wmthompson1-skills account on Skills-Inc-Org, but I am not sure how to switch out agents on my Visual Studio Code.

