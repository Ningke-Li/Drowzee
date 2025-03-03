:- include('database.pl').
tennis_at_the_2008_summer_olympics(Start,End) :- begin('tennis_at_the_2008_summer_olympics',_,_,Start), end('tennis_at_the_2008_summer_olympics',_,_,End), Start=<End.

tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

generate_facts_tennis_at_the_2008_summer_olympics_OR_tom_and_jerry([]) :- assert(tennis_at_the_2008_summer_olympics_OR_tom_and_jerry(-1,-1)).

generate_facts_tennis_at_the_2008_summer_olympics_OR_tom_and_jerry([(Start,End) | Tail]) :- assert(tennis_at_the_2008_summer_olympics_OR_tom_and_jerry(Start,End)), generate_facts_tennis_at_the_2008_summer_olympics_OR_tom_and_jerry(Tail).

tennis_at_the_2008_summer_olympics_OR_tom_and_jerry_aux() :- findall((Start,End),tennis_at_the_2008_summer_olympics(Start,End),Interval1), findall((Start,End),tom_and_jerry(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tennis_at_the_2008_summer_olympics_OR_tom_and_jerry(Interval).

tennis_at_the_2008_summer_olympics_OR_tom_and_jerry_at_1941(Res) :- setof((Start,End),tennis_at_the_2008_summer_olympics_OR_tom_and_jerry(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = tennis_at_the_2008_summer_olympics_OR_tom_and_jerry_at_1941'), (tennis_at_the_2008_summer_olympics_OR_tom_and_jerry_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tennis_at_the_2008_summer_olympics_OR_tom_and_jerry_aux().

