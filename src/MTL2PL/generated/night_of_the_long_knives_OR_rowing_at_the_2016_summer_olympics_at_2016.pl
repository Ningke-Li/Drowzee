:- include('database.pl').
night_of_the_long_knives(Start,End) :- begin('night_of_the_long_knives',_,_,Start), end('night_of_the_long_knives',_,_,End), Start=<End.

rowing_at_the_2016_summer_olympics(Start,End) :- begin('rowing_at_the_2016_summer_olympics',_,_,Start), end('rowing_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics([]) :- assert(night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics(-1,-1)).

generate_facts_night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics(Start,End)), generate_facts_night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics(Tail).

night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics_aux() :- findall((Start,End),night_of_the_long_knives(Start,End),Interval1), findall((Start,End),rowing_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics(Interval).

night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics_at_2016(Res) :- setof((Start,End),night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics_at_2016'), (night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- night_of_the_long_knives_OR_rowing_at_the_2016_summer_olympics_aux().

