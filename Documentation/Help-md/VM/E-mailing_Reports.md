E-mailing Reports




# E-mailing Reports

If your computer has a default e-mail client, then
no preparation is required to e-mail VISUAL reports. Your computers
e-mail client is used when you e-mail reports. However, if your systems
default e-mail client is configured incorrectly, or if no default
e-mail client is configured, then to send e-mail from VISUAL you must
either:

* Set
  your installed e-mail client as the default.

**OR**

* Use
  SMTP (Simple Mail Transfer Protocol) settings in VISUAL to connect
  to an e-mail server such as Gmail or Thunderbird. With this method
  you send VISUAL reports from the VISUAL e-mail dialog. It is assumed
  that you have a valid account sign in credentials with the SMTP
  provider. Set up e-mail preference entries in the eMail section
  of the Preferences Maintenance window.

## Setting your Installed E-mail Client as the Default

If your e-mail client is not configured as the default, you will
see an Email Settings dialog when you send a report via e-mail.

To configure your installed e-mail client as the default:

1. In the Windows Control
   Panel, click **Default Programs**.
2. Click **Set
   your default programs**.
3. From the list of available
   software, select the installed e-mail client to be the default,
   for example Microsoft Outlook.
4. Click **Choose
   defaults for this program**.
5. In the Set associations
   for a program window, select the **MAILTO**
   check box in the Protocols section.
6. Click **Save**.
7. Select a report to generate.
8. Select **E-Mail**
   for the output format and then click **Ok**.

## Configuring SMTP E-mail Settings

If an e-mail client is not installed on your computer, you can configure
VISUAL to send e-mail using SMTP relay. When VISUAL is configured
to use SMTP relay for outgoing e-mail, a simple e-mail dialog is provided
to allow you to add e-mail recipients and attach reports.

To configure VISUAL to use SMTP when no default e-mail client exists:

1. Select Admin,
   Preferences Maintenance.
2. Select **eMail**
   from the Section Filter drop-down list.
3. Click the **Insert**
   toolbar button and add an entry for each of these preferences:

Server Address - The host name of the outgoing
SMTP server address that your e-mail uses, for instance smtp.example.com.

Server Port - The port name used by the
outgoing SMTP mail server. Port numbers 25, 465, or 587 are frequently
used, but check with your e-mail service.

User Name - The user name for your default
e-mail account. This may be your full e-mail address.

User Password - The password that you use
to sign in to your default e-mail account.

Use SSL - Some SMTP providers require the
use of Secure Socket Layer (SSL) security. To enable SSL Security,
specify Y as a value. If your SMTP provider does not require SSL,
specify N as a value.

4. Click **Save**.

## Using SMTP to E-mail Reports

After you set up SMTP relay settings, a VISUAL e-mail dialog is
opened when you e-mail a report.

To e-mail a report using SMTP:

1. Select your report and
   then select E-Mail as your output format and click **Ok**.

The VISUAL e-mail dialog displays with the
report attached and the User Name you specified when you specified
SMTP settings as the From e-mail address. You can:

* Specify recipient
  e-mail addresses as To: or Cc:
* Specify a
  subject
* Write a message
* Add more attachments
* Run the spell
  check
* Print the
  e-mail.

2. Click **Send**.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help