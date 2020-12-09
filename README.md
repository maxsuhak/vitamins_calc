Vitamins Calculator
===================

# User scenarios:
- As a user I can submit my height and weight in the database
- As a user I can enter my food intake for a specific day, represented by an amount (4 to 10) of Vitamin C, Vitamin D3 and Iron
- As a user I can enter my activity level, represented by a negative amount (1 to 3) of Vitamin C, Vitamin D3 and Iron
- As a user I can  request so that I can get a personalized recipe based on the above values (check formula below)
- As a user I can see my personal recipes that have been generated, day by day

# Assumptions:
- At the beginning of the day, all 3 values are 0
- We eat, then record an activity
- At the end of the day, all 3 values must be 10.

# The formula:
- The formula should take my values of Vitamin C, Vitamin D3 and Iron after the user has eaten
- It should subtract the activity level values from it
- It should then complete that result to the total of 10/10
- The output recipe should be the value that has been added in order to reach 10.

# Example: if I have:
5/10 in Vitamin C and my activity reduced it by 3,
7/10 in Vitamin D3 and my activity reduced it by 2,
4/10 in Iron and my activity reduced it by 1,

# The output should show:
```
Vitamin C 8 (current level is 5-3 = 2)
Vitamin D3 5 (current level is 7-2 = 5)
Iron 7 (current level is 4-1 = 3)
```
