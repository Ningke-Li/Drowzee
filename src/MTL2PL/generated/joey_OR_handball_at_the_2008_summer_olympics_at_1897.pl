:- include('database.pl').
joey(Start,End) :- begin('joey',_,_,Start), end('joey',_,_,End), Start=<End.

handball_at_the_2008_summer_olympics(Start,End) :- begin('handball_at_the_2008_summer_olympics',_,_,Start), end('handball_at_the_2008_summer_olympics',_,_,End), Start=<End.

generate_facts_joey_OR_handball_at_the_2008_summer_olympics([]) :- assert(joey_OR_handball_at_the_2008_summer_olympics(-1,-1)).

generate_facts_joey_OR_handball_at_the_2008_summer_olympics([(Start,End) | Tail]) :- assert(joey_OR_handball_at_the_2008_summer_olympics(Start,End)), generate_facts_joey_OR_handball_at_the_2008_summer_olympics(Tail).

joey_OR_handball_at_the_2008_summer_olympics_aux() :- findall((Start,End),joey(Start,End),Interval1), findall((Start,End),handball_at_the_2008_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_joey_OR_handball_at_the_2008_summer_olympics(Interval).

joey_OR_handball_at_the_2008_summer_olympics_at_1897(Res) :- setof((Start,End),joey_OR_handball_at_the_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = joey_OR_handball_at_the_2008_summer_olympics_at_1897'), (joey_OR_handball_at_the_2008_summer_olympics_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).
?- joey_OR_handball_at_the_2008_summer_olympics_aux().

