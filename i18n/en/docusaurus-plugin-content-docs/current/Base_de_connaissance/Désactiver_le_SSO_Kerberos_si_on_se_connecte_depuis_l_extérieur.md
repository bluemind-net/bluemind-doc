---
title: "Disabling the Kerberos SSO if Connecting from Outside"
confluence_id: 79863509
position: 52
---
# Disabling the Kerberos SSO if Connecting from Outside


# Issue

1 When Kerberos is enabled, hps returns the login page with http 401 status so that the internet browser starts a krb dialog. With some browsers, this leads to a popup opening and prompting for a login ID and AD password.This behavior needs to be stopped for the browser to open the standard homepage as this popup confuses users.When connecting from outside, machines are outside the domain and the SSO cannot work, this popup should not appear.
1 Logging out doesn't work properly if the SSO isn't working (e.g. for a machine connecting from outside).The appcache reads something like "if code http != 200 => go offline". As a result, if you log out from the Contacts or Calendar application, you are not redirected to the BlueMind homepage although you are logged out from the server's point of view and the browser continues to display the application.


# Solution

With respect to an HTTP proxy, if you are on a network where the SSO cannot work (external, as in the example below), you need to:

1 Redirect the / towards /native if connecting from outside. 
1 Redirect the 401 status from /cal and /contact to the homepage.


Edit the relay's VHost NGinx by adding the sections:


```
geo $local {
  default 0;
  127.0.0.0/8 1;
  192.168.0.0/16 1;
  172.16.0.0/12 1;
  10.0.0.0/8 1;
}

server {
  ...
  location / {
    proxy\_intercept\_errors on;

    if ($local = 0) {
      error\_page 401 https://bluemind-ext-url/native;
    }

    proxy\_pass https://bluemind-srv;
  }

  location /cal {
    proxy\_intercept\_errors on;

    if ($local = 0) {
      error\_page 401 https://bluemind-ext-url/;
    }

    proxy\_pass https://bluemind-srv;
  }

  location /contact {
    proxy\_intercept\_errors on;

    if ($local = 0) {
      error\_page 401 https://bluemind-ext-url/;
    }

    proxy\_pass https://bluemind-srv;
  }
  ...
}
```


