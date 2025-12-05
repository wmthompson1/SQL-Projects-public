Logging on as SYSADM When Single Sign On Is Enabled




# Signing in as SYSADM When Single Sign On Is Enabled

Unless SYSADM is a user name in your domain, you must use a command
line argument to sign into VISUAL as SYSADM.

If you use a shortcut, you can add the command line argument to
the shortcut path.

1. Right-click the shortcut
   and select Properties.
2. In the Target field,
   add -SYSADM after the executable path.
3. Click Ok.

You can also send a command line argument using Windows Run feature.

To send a command line argument using the Run feature:

1. Click the Windows Start
   button and select Run....
2. Specify the path to
   VM.exe, then append -SYSADM
3. Click Ok.

You can then sign in as the SYSADM user.

Since only the SYSADM user can disable single sign on, you must
use the command line argument to sign into VISUAL to disable single
sign on.