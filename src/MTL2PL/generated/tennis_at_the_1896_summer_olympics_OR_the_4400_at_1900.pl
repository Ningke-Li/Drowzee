:- include('database.pl').
tennis_at_the_1896_summer_olympics(Start,End) :- begin('tennis_at_the_1896_summer_olympics',_,_,Start), end('tennis_at_the_1896_summer_olympics',_,_,End), Start=<End.

the_4400(Start,End) :- begin('the_4400',_,_,Start), end('the_4400',_,_,End), Start=<End.

generate_facts_tennis_at_the_1896_summer_olympics_OR_the_4400([]) :- assert(tennis_at_the_1896_summer_olympics_OR_the_4400(-1,-1)).

generate_facts_tennis_at_the_1896_summer_olympics_OR_the_4400([(Start,End) | Tail]) :- assert(tennis_at_the_1896_summer_olympics_OR_the_4400(Start,End)), generate_facts_tennis_at_the_1896_summer_olympics_OR_the_4400(Tail).

tennis_at_the_1896_summer_olympics_OR_the_4400_aux() :- findall((Start,End),tennis_at_the_1896_summer_olympics(Start,End),Interval1), findall((Start,End),the_4400(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tennis_at_the_1896_summer_olympics_OR_the_4400(Interval).

tennis_at_the_1896_summer_olympics_OR_the_4400_at_1900(Res) :- setof((Start,End),tennis_at_the_1896_summer_olympics_OR_the_4400(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = tennis_at_the_1896_summer_olympics_OR_the_4400_at_1900'), (tennis_at_the_1896_summer_olympics_OR_the_4400_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tennis_at_the_1896_summer_olympics_OR_the_4400_aux().

