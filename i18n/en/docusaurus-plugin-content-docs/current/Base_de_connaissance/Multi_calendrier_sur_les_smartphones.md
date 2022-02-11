---
title: "Multi-calendar feature on smartphones"
confluence_id: 79863528
position: 62
---
# Multi-calendar feature on smartphones


# Introduction

An experimental BlueMind feature allows users to view several calendars on their smartphones.

This feature is to be used with caution: some known malfunctions haven't been resolved at this time. See below.
:::important

In BlueMind 4, this only applies to the user's own calendars (default calendar and secondary personal calendars): calendars shared with the user, domain calendars or other users' calendars cannot be viewed on smartphones.

:::

# Server-side implementation

Configure this feature by creating a system file.


```
# touch /root/eas.multical
```


Restart EAS service:


```
# service bm-eas restart
```


# How it works

For shared calendars to be displayed, users must first **subscribe** to them in BlueMind, in Parameters > Calendar > Subscriptions.

# Known limitations

### Android: Google Calendar

On Android, all shared calendars are shown in the same color, which makes it impossible to tell different calendars apart.

**Solution:** Install a third-party app which lets users choose different colors for different calendars.

E.g. this which has been tried and verified by BlueMind: [https://play.google.com/store/apps/details?id=net.slintes.android.ccc.full](https://play.google.com/store/apps/details?id=net.slintes.android.ccc.full)

### Samsung: SPlanner

In Samsung's SPlanner app, all shared calendars merged into the user's calendar.

**Solution: **Install and use Android's default app [Google Calendar](https://play.google.com/store/apps/details?id=com.google.android.calendar).

Note: In some devices/versions, events from secondary calendars are not shown at all in the SPlanner app

