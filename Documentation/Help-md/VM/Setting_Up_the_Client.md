Setting Up the Client




# Setting Up the Client

To set up the client machine to use single sign on, either add -SSO
to the target in the shortcut to VM.exe or add the SingleSignOn=Y
value to the VIsualMfg section of the VISUAL.ini file.

## Adding -SSO to the Shortcut

To add -SSO to the shortcut:

1. Right-click the shortcut
   and select Properties.
2. In the Target field,
   add -SSO after the executable path.
3. Click Ok.

## Adding SingleSignOn to the VISUAL.ini File

To enable single sign on for the client using the VISUAL.ini file:

1. Navigate to the VISUAL.ini
   file and open it in a text editor.
2. Add this line to the
   VisualMfg section in the VISUAL.ini file:

SingleSignOn=Y.

3. Select File,
   Save.