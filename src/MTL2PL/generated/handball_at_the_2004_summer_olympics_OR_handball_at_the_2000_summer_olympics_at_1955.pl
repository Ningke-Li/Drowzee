:- include('database.pl').
handball_at_the_2004_summer_olympics(Start,End) :- begin('handball_at_the_2004_summer_olympics',_,_,Start), end('handball_at_the_2004_summer_olympics',_,_,End), Start=<End.

handball_at_the_2000_summer_olympics(Start,End) :- begin('handball_at_the_2000_summer_olympics',_,_,Start), end('handball_at_the_2000_summer_olympics',_,_,End), Start=<End.

generate_facts_handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics([]) :- assert(handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics(-1,-1)).

generate_facts_handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics([(Start,End) | Tail]) :- assert(handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics(Start,End)), generate_facts_handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics(Tail).

handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics_aux() :- findall((Start,End),handball_at_the_2004_summer_olympics(Start,End),Interval1), findall((Start,End),handball_at_the_2000_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics(Interval).

handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics_at_1955(Res) :- setof((Start,End),handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics_at_1955'), (handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).
?- handball_at_the_2004_summer_olympics_OR_handball_at_the_2000_summer_olympics_aux().

