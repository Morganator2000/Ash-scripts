# Here's what we know about the Interesting coins as of August 1, 2026.
# You get 4 of them on ascension or on opening the packet
# You get 1 of them on breaking prism if you didn't have any due to thrifty or something like that
# You get more of them over rollover:
#   If you had 0 coins at rollover, you get 1
#   If you had fewer than 20 coins at rollover, you get 3
#   If you had 20 or more coins at rollover, you get 20% of your coin count, rounded down.

# So let's figure out how many days in aftercore it would take to get the:
#   gross prophet chrysalis (10 million coins)
#   bull tattoo (16,777,215 coins; the limit)

import math as m

# Calculate how many coins you get in a given day
def getCoins(currentCoins):
    if(currentCoins == 0):
        return 1
    elif(currentCoins < 20):
        return 3
    elif(currentCoins >= 20):
        return m.floor(currentCoins * 0.2)

# With an initial starting amount of coins, how many days will it take to get to your goal?
def runSimulation(initialCoins, goal):
    days = 0
    coins = initialCoins
    while(coins<goal):
        earnedCoins = getCoins(coins)
        coins = coins + earnedCoins
        days = days + 1
    print("With " + str(initialCoins) + " coins, you will reach your goal of " + str(goal) + " coins in " + str(days) + " days!")

# Run the simulation
runSimulation(4, 10000000)
runSimulation(4, 16777215)