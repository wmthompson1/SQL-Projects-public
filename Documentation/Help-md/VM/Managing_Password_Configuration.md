Managing Password Configuration




# Managing Password Configuration

To enhance the security of your VISUAL programs, the
password functionality includes the ability for the system administrator
to specify password requirements and longevity settings.

To specify Password Configuration settings:

1. After logging into VISUAL
   as the system administrator, from the Security menu, select Password Configuration.

The Password Configuration dialog box appears.

2. If you do not want your
   users to use their User ID as a password, select the User
   ID and Password Must Be Different check box.
3. In the Password Retention
   section, specify the following:

Retire Password After
If you want to force your users to change their passwords after
a set time, select the Retire Password Every
check box.

Days If you
selected the Retire Password Every check
box, enter the number of days you want VISUAL to wait before requiring
users to change their password.

Allow Reuse After
If you want to allow your users to reuse their passwords, select
the Allow Reuse After check box.

Cycles If you
selected the Allow Reuse After check box,
enter the number of cycle you want VISUAL to wait before allowing
users to repeat a password. For example, you are forcing users to
change their password but want to allow the reuse of a password after
they have changed it at least five times.

4. In the Retry Attempts
   section, specify the following:

# Retry Attempts Allowed
Specify the number of attempts users can make to enter the correct
password. If users exceed the number of retry attempts allowed, they
will be locked out of the database. When you specify a number in this
field, the system activates the Minutes to wait before retry and Password
must be reset by administrator options. Leave the field blank to allow
the user an unlimited number of attempts to enter the correct password.

Minutes to wait before
retry Select this option to require users to wait before
logging into the system after exceeding the number of retry attempts.
Specify the number of minutes you want users to wait in the Minutes
to wait before retry field.

Password must be reset
by administrator Select this option to require a system administrator
to reset user passwords after users exceed the number of retry attempts.
System administrators can reset passwords using the [Changing
Users Passwords](Maintaining_Users.md#ChangingUsersPasswords) procedure.

5. In the Password Identification
   section, specify the following:

Minimum Password Length
If you want to force users to have passwords of at least a certain
length, enter that length in the Minimum Password
Length field. At this point, users can have passwords comprising
of any alpha-numeric combination, including special characters like
#, $, and \_.

Minimum Digits
If you want to force users to use numeric characters in their passwords,
enter the minimum quantity of numeric characters you want VISUAL to
enforce in the Minimum Digits field.

Minimum Letters
If you want to force users to use alphabet characters in their passwords,
enter the minimum quantity of alphabet characters you want VISUAL
to enforce in the Minimum Letters field.

Minimum
Uppercase Letters If you are enforcing the use of letters
in your passwords, you can also require some or all of those letters
to be uppercase. Click in the Minimum Uppercase
Letters field and enter the quantity of letter that have to
be uppercase.

Minimum
Lowercase Letters If you are enforcing the use of letters
in your passwords, you can also require some or all of those letters
to be lowercase. Click in the Minimum Lowercase
Letters field and enter the quantity of letter that have to
be lowercase.

Minimum Special Characters
(# $ \_) If you want to force users to use special characters
in their passwords, enter the minimum quantity of special characters
you want VISUAL to enforce in the Minimum Special
Characters field.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.md) User-defined Help