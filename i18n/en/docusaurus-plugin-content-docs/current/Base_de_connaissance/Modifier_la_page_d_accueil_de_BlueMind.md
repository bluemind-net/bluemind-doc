---
title: "Editing the BlueMind Homepage"
confluence_id: 79863527
position: 60
---
# Editing the BlueMind Homepage


# Introduction

By default, BlueMind lets you [customize the homepage logo](https://forge.bluemind.net/confluence/display/BM35/Personnaliser+le+logo+de+l+application).

To replace the default homepage by a customized page, you have to write an HPS extension.
:::important

The procedure shown here is just an example.

After an update, you may have to adapt it to the new BlueMind version.

If this extension is present in your installation, we strongly recommend that you test its behavior on a pre-production platform using the version of BlueMind you are planning to use in production.

:::

# Prerequisites

A test installation of BlueMind in the latest available version.

# Principle

To edit the BlueMind homepage and replace it by your own custom version, you have to write an HPS extension that will overload the official homepage's template and resources.

# Initialising the extension

## Naming the extension

You have to give your extension a name. This name can use the *[a-z]* characters and "*."* (period).
:::important

In this document, we've chosen to name the extension *my.sample.loginpage*, make sure you replace it by the name you have chosen for your extension.

:::

## Creating a structure for the extension

Connect as the *root* user on the BlueMind test installation, then:

1 
Run the following commands:


```
mkdir /root/my.sample.loginpage
cd /root/my.sample.loginpage
mkdir META-INF templates web-resources

```


1 
Create a file named `/``root/my.sample.loginpage/META-INF/MANIFEST.MF,` with the following content: 


```
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: my.sample.loginpage
Bundle-SymbolicName: my.sample.loginpage
Bundle-Version: 1.0.0
Bundle-Vendor: bluemind.net
Fragment-Host: net.bluemind.webmodules.loginapp
Bundle-RequiredExecutionEnvironment: JavaSE-1.8
```

:::important

Remember to adapt the `Bundle-Name` and `Bundle-SymbolicName` lines according to the name you have chosen for your extension.

:::


# Defining your homepage

The homepage essentially contains two types of data:

- the page's **HTML code** in a template
- the page's **resources** (images, CSS...).


HTML

The page's HTML code has to be put into the file named `templates/login.xml`. BlueMind will analyze this template file and dynamically populate it with data.

`The &lt;body>` section of the template has to contain the authentication form's original code – the latest version of this code can be found on [the login.xml page of our git repository](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/templates/login.xml). Copy the following code sections:

1 From `&lt;#if authErrorMsg??>` to `&lt;/#if>` (tags included)
1 The actual form's part of the code: from `&lt;form>` to `&lt;/form>` (tags included)


In addition, the template's `&lt;/body>` tag has to be preceded by:


```
${jsRuntime}
```


## Resources

Homepage resources -- images, CSS sheets... -- have to be placed into the `web-resources`page.

You can reference the resources from this repository into the HTML code. E.g. to insert the `web-resources/sample.jpg` resource from the `templates/login.xml` template:


```
<img src="sample.jpg>Sample image</img>
```

:::important

If you create a folder structure, use the relative notation to reference the folders, always with `web-resources` as the root folder. E.g. for a CSS sheet  in`/web-ressources/css/style.css`:


```
<link rel="stylesheet" href="css/style.css" />
```


Note: the folder structure **doesn't start with **'/', which would point to the website's root. 

:::

You can find default resources in our git repository: [https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/web-resources](https://forge.bluemind.net/stash/projects/BM/repos/bluemind-public/browse/ui/webmodules/net.bluemind.webmodules.loginapp/web-resources)

# Building and installing the extension

Log in as *root* on the BlueMind test installation, then:

1 
Build the extension


```
cd /root/my.sample.loginpage
/usr/lib/jvm/bm-jdk/bin/jar cvfm /root/my.sample.loginpage\_1.0.0.jar META-INF/MANIFEST.MF .
```


1 
Install the extension:


```
cd /usr/share/bm-hps/extensions
mkdir my.sample.loginpage
mv /root/my.sample.loginpage\_1.0.0.jar my.sample.loginpage/
```


1 
Restart the HPS service:


```
/etc/init.d/bm-hps stop
rm -rf /var/lib/bm-hps
/etc/init.d/bm-hps start
```


Then log into BlueMind, your custom homepage should be displayed instead of the standard BlueMind homepage.
:::important

If your homepage isn't displayed, force-refresh your browser by holding the *shift* key while reloading the page.

Using your web browser in private mode also helps prevent possible cache issues.

:::

# Notes

## Example

The code for the *my.sample.loginpage* plugin described in this documentation is available at: [https://github.com/bluemind-net/loginapp-plugin-sample/tree/master/my.sample.loginpage](https://github.com/bluemind-net/loginapp-plugin-sample/tree/master/my.sample.loginpage).

To test it:

1 Download the extension here: [https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar](https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar)
1 Refer to steps 2 and 3 of the [Building and installing the extension](#EditingtheBlueMindHomepage-buildAndInstall) paragraph.

:::important

The contents of the [extension](https://github.com/bluemind-net/loginapp-plugin-sample/raw/master/build/my.sample.loginpage_1.0.0.jar) can be edited using software that supports the zip compression format (e.g. winzip).

You can replace the `templates/login.xml` template file, and add or delete resources in the `web-resources`folder.

:::

