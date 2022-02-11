---
title: "Autodiscover not found by Android mobile devices"
confluence_id: 79863417
position: 68
---
# Autodiscover not found by Android mobile devices


# Symptoms

When you configure an Android mobile device, the server address's prefix is missing.

Yet, according to the online diagnostic at [https://testconnectivity.microsoft.com/](https://testconnectivity.microsoft.com/), the *autodiscover* configuration is correct. 

# Problem

Android has a distinct behavior if the email address's domain is resolved at the DNS level: if a website (other than BlueMind) exists at the address ***https://&lt;bluemind.domain.com>, ***then Android attempts to retrieve the autodiscover configuration from ***https://&lt;bluemind.domain.com>/autodiscover*** (or ***https://&lt;bluemind.domain.com>/Autodiscover***)

# Solution

Configure the website so that it sends https requests to BlueMind:


```
location /autodiscover {
    rewrite ^(.*) https://bluemind.domain.com$1?$args permanent;
}

location /Autodiscover {
    rewrite ^(.*) https://bluemind.domain.com$1?$args permanent;
} 
```


