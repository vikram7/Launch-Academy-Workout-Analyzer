Challenge

Because you are a huge nerd and you like working out (let's pretend), you've decided to track all your workouts in a CSV. Now you want to write an object-oriented program that will run some analytics on your data.

Specifically, you want a program that when run will output the following summary given the data in the CSV:

Workout Stats:

ID | DATE       | TYPE     | DURATION | CALORIES_BURNED
---|------------|----------|----------|----------------
1  | 2014-08-15 | strength | 17.5     | 92.5
2  | 2014-08-16 | cardio   | 40       | 320.0
3  | 2014-08-17 | cardio   | 43.0     | 247.5
4  | 2014-08-20 | cardio   | 35       | 280.0
5  | 2014-08-22 | strength | 34.5     | 195.0
6  | 2014-08-23 | other    | 90       | 540.0
Define a Workout class that encapsulates the necessary data and the methods that calculate this information.

Some hints:

A workout should be categorized as a "cardio" workout if at least 50% of the exercises were cardio exercises. It is a "strength" workout if at least 50% of the exercises were strength exercises. Otherwise, it should be categorized as "other".
"Duration" should add up the duration of all of the exercises in a given workout.
For calories burned, assume the following:
high-intensity cardio exercises burn 10 calories/min
medium-intensity cardio exercises burn 8 calories/minute
low-intensity cardio exercises and strength exercises burn 5 calories/minute
all other exercises burn 6 calories/minute
You can use the table_print gem to print out tables in your console.
