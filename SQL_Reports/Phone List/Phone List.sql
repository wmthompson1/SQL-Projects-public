select displayName, telephoneNumber,homePhone,pager,mobile,ipPhone,mail,facsimileTelephoneNumber from 'LDAP://dc=skillsinc,dc=local' where 
objectCategory='user' and telephoneNumber > 1 or pager > 1 or mobile > 1 and objectCategory='contact'
