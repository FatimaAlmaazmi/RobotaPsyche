## Assignment 4
### Bee Evolution

For this assignment, I created an ecosystem of bees. The code also illustrates the evoultion of bees. If a male bee reaches his maximum life-span and 'spends time' with the queen, he dies, and produces 2-3 more random offsprings. The cycle continues on like that.


Debugging this code is what I spent the most time on. I did not understand the nature of my code in the begining, but I got the hang of it at the end, and now it seems easy. 

The first problem that I ran into was in the DNA class, where I wanted it to determine the gender of each bee randomly and then determine the size of the bee accordingly. Male bees are generally larger than female bees, and that is what I wanted to showcase in the code and for myself to distingusih between them. 

However, the code did not display the bees for some reason. And, it turned out that I was using the random() function wrong. I declared the variable 'gender' as a float, and if I use the random(a, b) function on a float, it will go through the numbers in decimels and it will not use the value 'b' but a.99

Therefore, as the professor explained on discord, I need to add a round() function to it as well. This immediately fixed my problem, and my code started working perfectly after. 

The other problem I encountered was trying to figure out if my code actually worked the way I wanted it to or not. I was not entirely sure if my code really did kill off the male bees and generated other bees. That is partly due to the fact that I used one picture for all of the bees, and the only way I could distinguish them is from their size (which was difficult to tell). To fix this, I drew my own bees. 


Female bees with pink bows on their heads and a stinger:


![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/March1/fbee.png)



Male bees with moustaches and no stinger (apparently male bees don't have that):


![](https://github.com/FatimaAlmaazmi/RobotaPsyche/blob/main/March1/mbee.png)




This helped a bit. But I was still unsure if the male bees were dying. I also tried a println to help me see that, but I did not feel that it gave me enough evidence. Finally, I knew that I had to dial the number of the bees down. I had 10 bees generated at the start and in a few secs they would evolve to a 100. So, I generated 2 at the start, and then I could clearly see that only the male bees were dying off, and generating 2-3 random bees afterwards. 



That finally settled my code, and I was happy with how it turned out.





Thank you :)
