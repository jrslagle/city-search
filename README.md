# city_search

This is a program to create a ranked list of 574 US cities using the weighted average of a set of statistics.


Data Collection

-data will be stored in a tabular database. Retrieval methods also need tabular customization (each stat for each city). For instance, all temperature data will be taken from http://www.usclimatedata.com/, but each city has it's own page on that server. In the retrieval method database, a retrieval method is the url plus how to extract the number from the source. Orders to download more data go through a series of filters. The data manager takes what table cells are empty, and generates a draft order. This is filtered by data that is known (by previous attempts) to be unavailible. Requests that come back without your data will be added to the appropriate black-list for future reference. Requests that come back successful will be added to the database.


List of Cities

https://en.wikipedia.org/wiki/List_of_primary_statistical_areas_of_the_United_States

-there are 574 metropolitan areas on this list. All stand separate from other metros - no metros are nested. Separation is largely determined by cross-commuting of no more than 25%. The Metropolitan area is my preferred scale because I spend ~97% of my time within my metro, but also drive between every corner of it frequently. My new friends, social time, networking, sense of threat or corruption are all spread across the whole metro, but rarely outside it.


Scoring

-each city will be scored from a normalized weighted average of all stats. 


Normalization

-it is assumed that these stats will contain outliers, so scaling will be determined by standard deviation.

normalized_data[i] = (original_data[i] - average) / standard_deviation


Determining Stat Weight

-start with all sections having the same weight. Then have each sub-stat contribute equal weight to its section. Then subtract from each the degree of redundancy between it and all subsequent stats. This means if two variables correlated perfectly, the second would be brought to weight 0. To determine redundancy, calculate how much the given stat can be predicted by all the other stats. Do this by iteratively subtracting linear regression models from the stat in question (like I did in previous projects). Later I can upgrade the regression models to be non-linear. The residual signal that cannot be predicted (by other stats in the set) scales the new weight of that stat (see equation 2).
-run a test to see if reducing redundancy twice gives you different weights. If it does, I'm missing something.

Equation 2

new_weight = old_weight * (sum(abs(residual_array)) / sum(abs(data_array)))


Health

-high life expectancy - only possible in cultures that either already live in healthy environments, have a healthy lifestyle, or have built the infrastructure to provide safety and good health care.

http://www.worldlifeexpectancy.com/usa/utah-life-expectancy-by-county-male

http://www.worldlifeexpectancy.com/usa/utah-life-expectancy-by-county-female

-low air quality index (AQI) - because it’s one of the few health risks I’m stuck with in a city.

http://www.city-data.com/city/St.-George-Utah.html

-low rate of Type 2 Diabetes Mellitus - I'm predisposed to diabetes, and perhaps a region with low diabetes will be the right culture to diminish my risk factors.

Economics-

-low total population income gini after redistribution - partly for trust between strangers, partly because it's a signal for corruption, but also these economies should be more sheltered from a high job automation future. 

http://www.city-data.com/income/income-St.-George-Utah.html

http://blogs.lib.uconn.edu/outsidetheneatline/2014/01/28/gini-index-of-income-inequality-for-u-s-counties/

-minimum wage to cost of living ratio - what is the standard of living of the poorest?

http://www.city-data.com/county/Washington_County-UT.html

-# of job listings in my field - using a simple title keyword search.

http://stgeorge.craigslist.org/search/jjj

-high number of college students - to give a sense of the size and prestige of its college(s). For the sake of job training & the general intellectual quality strangers expect you to uphold.

http://www.city-data.com/city/St.-George-Utah.html

-low cost to get an AS in Computer Science 

Culture

-high number of high match % people on okcupid.com. - Still unsure of what math I'll use. Should give me a deeper look at what beliefs and cultural conventions are common in an area and compatible with myself. “would I date this city?” “how many awesome people are there to choose from in city X?”

-low rate of obesity - for a better dating pool, what can I say?

-low crime rate - for the sake of trust of strangers and peace of mind, and it indicates less corruption. (the score I use will be a projection (exponential trend line) to three years in the future).

http://www.city-data.com/city/St.-George-Utah.html

-low average commute time - for less smog, less money on gas, less frustration, less lost time, and more time with each other. 

http://www.city-data.com/county/Washington_County-UT.html

-low % Republican vote in the 2004, 2008, & 2012 presidential elections - hopefully this will stand in place of minimizing repression on secular lifestyles - alcohol laws, abortion clinics, sex education, teaching evolution in school, environmental irresponsibly, etc. 

http://www.city-data.com/elec08/UTAH.html

-high voter turnout per whole population - Should serve as a proxy for how much power people believe they have vs their perceptions of corruption. Comparing to whole population because restricting voter eligibility is a kind of corruption. 

http://www.city-data.com/elec08/UTAH.html

? low suicide rate - tied to how judgemental and exclusionary the culture is to their own people. While suicide tends to be far above background in narrow targeted groups of people (and thus unlikely to target me directly), it still tells me a lot about how tolerant everyone else is. 

http://www.worldlifeexpectancy.com/usa/utah-suicide

? low % now married - to represent how “big city” the culture is around exclusivity, career focus, and independence culture.

http://www.city-data.com/city/St.-George-Utah.html


Climate-

-low # of days you need gear to go outside (highs above 80, lows below 50, and rainy days - The less concessions you have to make to go outside the better.

http://www.usclimatedata.com/

-high annual rainfall - I like vegetation a lot. Preferably get ahold of the Normalized Difference Vegetation Index (NDVI) on a per city scale. 

http://www.usclimatedata.com/


-consider other cities that rank high when you ignore one stat at a time.
? Stats marked with a question mark are those I'm considering eliminating.

