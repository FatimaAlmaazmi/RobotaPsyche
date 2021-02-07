## Assignment 1
### Moving Car

In this assignment I had to use PVectors and functions to move a car.

It was easy to put it together at first, but my code had to go through a series of changes that made me understand what I was working with.

------

### Problem 1:

When I drew the car at first, I did not think about the perspective that I would be looking at it, and simply went for a simple 2D car.


![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/Screen%20Shot%202021-02-07%20at%209.55.59%20PM.png)


However, when the car started moving to the left, it was upside down. I knew something wasn't right, and I was not sure what to fix exactly. At first I thought that I would leave it the way it is, but I did not realize that the solution to my problem was so easy!


![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/Screen%20Shot%202021-02-07%20at%209.56.07%20PM.png)

I realized that the only way that I can solve this, is if I change the perspective of my car. So, I drew it as if I am looking at it from above. And, that surely solved that problem.


![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/pics/Screen%20Shot%202021-02-07%20at%209.56.32%20PM.png)

-----

### Problem 2

The other problem I faced was stopping the car. I could not find a way to do that. I went on discord to ask, but I saw that Katie had asked about the same thing and that she used the friction force. It made sense to me, so I tried it out. And, it worked! kind of..

When the car stops, it glicthes from left to right. And, the Professor said that the problem with this is that the float might never reach zero, which is why this happens. What I need to do is add a condition like an if() statement that would change the acceleration value to zero whenever it is less than that. However, I am still unsure of how to do that properly, so I thought that I would ask the Professor tomorrow in class :)



All in all, it was a great exercise. I feel that I am slowly but surely getting to understand PVectors and how to work with them.


:)

