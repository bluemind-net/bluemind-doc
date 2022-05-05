---
title: "Resources"
confluence_id: 57770793
position: 52
---
# Resources


## Introduction

In addition to personal or group calendars, BlueMind allows you to manage resource calendars (vehicles, rooms, video projectors, etc.).

The administrator can create new resources and delegate their management to users.

You can check for resource availability through the free/busy feature, just like you would for a person's calendar.


## Resource rights

You can be granted the following rights levels for resources:

1. **Booking**: you can link resources to meetings and make booking requests.  
2. **Booking and viewing**: in addition to right number 1, you can view the resource's calendar, see its bookings and requests pending. 
3. **Modifying bookings**: in addition to rights number 2, you can modify resource bookings (accept, reject, edit, move, delete, etc.). In this case you are appointed **resource manager**.
4. **Modifying bookings and managing shares**: in addition to rights number 3 as resource manager, you are able to modify and grant share rights for this resource.


## Booking a resource 

To book a resource, follow the steps below:

1. Add the resource you want to book to the list of event participants, either when you create or edit the event. You can check its availability just like you would for attendees:![](../attachments/57770793/57770800.png)

2. When you save an event, you can choose whether to send an invitation or not. This invitation is a resource booking request sent by email.
3. The resource's appointed manager(s) receive(s) a request via Calendar alert if the resource's calendar is currently displayed in their application ** **and** **by email if an invitation has been sent.


![](../attachments/57770793/57770798.png)

The manager can accept the request from within the booking request email


![](../attachments/57770793/57770796.png)

The manager can see the resource's event as pending validation


4. At this point, there are two possibilities depending on the [booking policy](/Guide_de_l_administrateur/Gestion_des_entités/Ressources/) chosen for the resource:
    1. Auto-accept and reject are both enabled:
        - the resource manager receives a resource booking message
        - if the resource is available, its participation is confirmed
        - if the resource isn't available, its participation is rejected
        - the user receives an acceptance or rejection message from the resource
    2. Auto-accept and reject are both disabled, the resource manager must confirm the booking request using one of the following methods:
        - in Mail, using the "Participation" link in the email they have received
        - in Calendar, in the pending events list (clicking the numbered icon in the navigation bar)
        - in Calendar by clicking the event: ![](../attachments/57770793/57770794.png)


:::tip

If auto-accept is enabled and auto-reject is disabled and the resource isn't available, then option "b" applies: the resource manager receives a booking request and the resource's participation status remains pending.

:::
5. You are then notified whether your request has been accepted or rejected.


:::info

The booking process is the same for resource managers: the resource's participation is not accepted automatically, resource managers must confirm the resource's participation once the event has been created.

Resource managers, however, do not receive requests for their own resource bookings, only other managers of this resource, if there are any, receive a booking request.

:::

## FAQs 

### General

#### Can a resource have several simultaneous bookings?

Yes, if the resource manager(s) accept(s) several booking requests for a same time slot, the resource will have several simultaneous reservations.

When you make a reservation, you are warned that the resource is unavailable but you can make a request anyway.

** Simultaneous bookings (overbooking) is prevented by default for new resources:** if a resource is available then its participation is confirmed automatically. If it is not available then the event is rejected automatically. The resource manager remains in control and can still modify event calendars manually.

**For resources created prior to this version, **BlueMind's former behavior is applied: the resource manager controls bookings through the resource calendar and chooses to accept requests for a same time slot or not (for resources that can be shared).

To find out more about booking configuration, please go to the chapter concerned: [Guide de l'administrateur > Administration des ressources > Politique de réservation](/Guide_de_l_administrateur/Gestion_des_entités/Ressources/)

### User FAQs

#### Autocomplete does not suggest the resource I am looking for 

Check with your administrator or the resource manager that you have indeed been granted booking rights. 

### Resource manager FAQs 

#### I do not receive booking alerts    

Look in your calendar's left pane and check that the resource calendar is shown in the list.

#### I do get booking alerts but I can't see the event or any other in my calendar

Check in your calendar's left pane and make sure that the resource calendar is not grayed out: if it is, this means that the calendar is there (therefore you get an alert) but not shown (events are hidden). 

#### I want to quit managing a resource 

You can delete your own resource management rights by going to user settings > Calendar > Sharings tab:

- Select the resource from the drop-down menu.  
- Edit or delete your rights in the list of authorized users or groups.  


:::info

If you lower your sharing rights, the shared resource editing window remains open until you leave the user settings window. Changes take effect immediately, and if you try to make other changes (to add new rights, for example), they will not be taken into account and you will get an error message («Operation not permitted») telling you that you are not allowed to do this.

:::

If you don't have management rights, ask a BlueMind administrator or another resource manager.


