:- include('database.pl').
february_2015(Start,End) :- begin('february_2015',_,_,Start), end('february_2015',_,_,End), Start=<End.

tennis_at_the_2004_summer_olympics(Start,End) :- begin('tennis_at_the_2004_summer_olympics',_,_,Start), end('tennis_at_the_2004_summer_olympics',_,_,End), Start=<End.

generate_facts_february_2015_OR_tennis_at_the_2004_summer_olympics([]) :- assert(february_2015_OR_tennis_at_the_2004_summer_olympics(-1,-1)).

generate_facts_february_2015_OR_tennis_at_the_2004_summer_olympics([(Start,End) | Tail]) :- assert(february_2015_OR_tennis_at_the_2004_summer_olympics(Start,End)), generate_facts_february_2015_OR_tennis_at_the_2004_summer_olympics(Tail).

february_2015_OR_tennis_at_the_2004_summer_olympics_aux() :- findall((Start,End),february_2015(Start,End),Interval1), findall((Start,End),tennis_at_the_2004_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_february_2015_OR_tennis_at_the_2004_summer_olympics(Interval).

february_2015_OR_tennis_at_the_2004_summer_olympics_at_1894(Res) :- setof((Start,End),february_2015_OR_tennis_at_the_2004_summer_olympics(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = february_2015_OR_tennis_at_the_2004_summer_olympics_at_1894'), (february_2015_OR_tennis_at_the_2004_summer_olympics_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- february_2015_OR_tennis_at_the_2004_summer_olympics_aux().

