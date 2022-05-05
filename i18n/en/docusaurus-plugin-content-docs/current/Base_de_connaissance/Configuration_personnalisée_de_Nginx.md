---
title: "Customizing Nginx"
confluence_id: 57771920
position: 50
---
# Customizing Nginx


 

## Introduction

Nginx virtual host files (such as  "*/etc/nginx/sites-enabled/bm-client-access"*) are managed by BlueMind and** must absolutely not be modified**.

These files are replaced during system updates, as a result, all local modifications are lost.

You can, however, add configuration files into "*/etc/nginx/sites-enabled/"* to customize configuration.

## X-Frame-Option configuration

By default, BlueMind can be included into a *frame*.

This behavior can be changed by adding the *X-Frame-Options* HTTP header to Nginx responses.


```
~$ sudo sh -c 'echo "add\_header X-Frame-Options DENY;" >> /etc/nginx/sites-enabled/configuration.local'
~$ sudo /etc/init.d/nginx restart
```


For more information on the *X-Frame-Options *response header, please refer to the [Mozilla documentation.](https://developer.mozilla.org/en-US/docs/HTTP/X-Frame-Options)

 

 

