## Final Project

**General**
Create an association towards sad vehicles. A sad vehicle would behave in a way that is odd or off, maybe it would quiver? or move slowly, or at a different pace than the rest of the vehicles. And, then the 'happy' or normal vehicles, would notice this and approach the sad vehicle, and give it some of their happiness. Then the sad vehicle turns normal and moves like everyone else. So, whenever the normal vehicles would see a sad vehicle they would approach it to help it. 


**Specific**
I've been reading a lot about orcas, from how they interact in the wild, to how they interact in captivity. And, one thing that I noticed is their sense of community? So, I will try to implement that with my idea.


Orcas in captivity, are nearly always suffering mentally and physically. And, sometimes this can be seen through their fins. Wild Orcas rarely have dorsal fins, and thats because they swim in wide areas with no ristrictions at all, and their fins enhance their hydrodynamics. In contrast, captive whales, who spend their lives in small tanks, and swim only in circular motions, are more likely to have dorsal fins. 



Even though, having a dorsal fin is not a direct association to sad orcas, but I beleive that all captive orcas are sad orcas.



So, in my code. Orcas with dorsal fins, are more likely to be sad. And they would swim differently from the other orcas. And, 'normal' orcas would swim in pods, and they will notice the sad orca, and approach it and help it, by making it part of their pod :)



------------------------------------------------------

### DAY1 19th April 2020

**Plan:**

recap on flocking code, and association code.

For now, my plan is to get my code to work, then I will work on how it looks :)



This is how I want the code to look like in the end:

![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/CamScanner%2004-19-2021%2011.50_1.jpg)

I want to have a flock or pod of orcas that swim around. When the mouse is clicked a random Orca (either sad/dorsal normal/dorsal sad/normal) to appear from the right. Then it will all depend on the type of Orca. If it is a normal orca, it will join the pod on its own. If it is a sad orca, it will swim around aimlessly alone, until the orca pod spots it and notices it and then approaches it to help it by making it part of their pod. Therefore, the number of orcas in a pod will keep increasing.


**What I did:**

On this day, I started working on my code. I copied the different types of codes that I will be needing for my code, like the association, flock, and seek codes. I changed them so that they fit the context of my code. But, I am confused as to why the association code did not work. I will work on it tomorrow.


-------------------------------

### DAY2 20th April 2021

**Plan:**

Since I took some time off, work on the code again and see what happens.


**What I did:**

I worked on my code today, and applied a few changes. First, I realized that I applied all of the concepts at once and did not check if they worked separately. Therefore, I worked on getting the flocking functions to work. I applied a few changes, and it worked nicely. Then I realized that they always leave the screen, and I wanted to find a way to keep them in. In 6th chapter of the Nature of Code, I found a function that does exactly this, so I applied it. It worked quite nicely.

The thing that I noticed today is that I was applying the association function in the wrong way. The professor constructed it in term of avoiding, and I have to construct it in terms of seeking. So, I'll have to find a way to do that, but I'm not sure.

I am also contemplating whether I should add a DNA class or not. I'm not sure.

-------------------------------------

### DAY3 21st April 2021

**Plan:**

work on code :)


**What I did:**

I did not get the chance to work on my code today, but I did schedule a meeting with the professor so we could work it out together :)

-----------------------------------------

### DAY4 24th April 2021

**Plan:**

Look over a few things and see what you missed. +
Try to draw the orcas.


**What I did:**

I did not realize this before, but I think that drawing the orcas will be pretty hard. I have some type of phobia, I am really scared of looking at pictures of orcas. I have nightmares about them sometimes, and they really scare me. But, at the same time, I love them and I care for them. They've been through so much in captivity, and I love this concept. I'll try my best to draw them without looking at references, so I might end up with weird creatures at the end of this project lol.


I tried drawing them... Here are the results:


![Dorsal Orca](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/dorsalOrca.png)

![Normal Orca](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/normalOrca.png)



In terms of code, I'm looking forward to working on it with the professor today, so yup :)


I worked on the code after the meeting. The professor cleared a lot of things for me. I feel more confident with my code now, but I need a bit more time to work on it to see why I am stuck. Inshallah I will work on it tomorrow night because I'm feeling quite tired.


----------------------------------------------------------------------

### DAY5 25th April 2021

I tweaked a few things in my code today, but its still not there yet. For some reason, the vehicles are jittery, and the normal orcas that should join the pod easily, end up trailing behind trying to catch up to the pod. This makes them look like sad orcas trying to join the pod.

I have no idea why its doing this, I'm trying to use println() to see if theyre performing the right tasks.But, they're still not working right.


---------------------------------------------------------------------

### DAY6 26th April 2021


I got feedback on my code from the professor today. I realized why my code was confusing, and the professor suggested how I can make it more concise. And, hopefully by doing this my problem will be solved.

So, all I need to do is fix my new Orca() parameters. Because there were too many repeated variables and random numbers being called, its bound not to work. So, hopefully I'll get to work on it tomorrow and see how it goes.

------------------------------------------------------

### DAY7 27th April 2021


I made the changes I was supposed to on my code. Unfortunately, its still working the exact same way. In fact they are more jittery than ever, and the normalOrcas are still acting lost and confused. 

My brain is going to explode. I need to orchestrate my concept. I don't know what to do.

---------------------------------------------------

### DAY8 28th April 2021

Okay, so I made a few more changes to the code. I made the canvas bigger, so that they would have more room to swim around. I also started using the display orca function instead of the triangles so I can mentally prepare myself for the final touches. They are still jittery. I tried to play around with a few variables to see if I can fix that, but still they're acting weird whenever a new orca comes in. 

My theory as to why this is happening is as so:

I think that there are too many seek functions acting on the orcas. When a new orca appears, the ora pod and the new orca get confused. On the one hand you have a new orca trying to seek the dorsal orcas within the pod, so its jittering like crazy. And on the other hand you have the pod trying to seek the new jittery orca. So they all jitter. 

I guess what I'm stuck on at the moment is trying to figure out how to limit my seek functions. I think I have a lot of functions acting on the velocity and forces of the orcas that they're going crazy.


During class I asked the professor for feedback, and he told me that my project worked the way it intended, so I don't need to stop the jittering. I'll try my best to fix it though, and inshallah on the 3rd of May, I'll have something decent to present.


What I got to do today for my code:

I cleaned up the code and made it look presentable and readable. I also drew my own background of the ocean for the code instead of using a solid color.

Here is the drawing of the ocean:



![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/ocean.jpg)



Surprisingly, after I added the ocean background, the orcas seemed to be less jittery? I don't know if its my imaginiation, but they're moving better than I expected and it looks presentable. 


I also uploaded a post to the processing forum to see if someone could help me with my code. I've never asked questions on forums, because usually my questions are already answered in another forum. So, since I have a special case now lol, it seems appropriate to do so (all thanks to the Professor of course for suggesting this). Hopefully someone responds, and my code will work the way I hoped it would.


So, as of now my plan is to give my code some time to breathe (and for me), and see if any new ideas come up. If so I'll make these changes and hope for the best :)


