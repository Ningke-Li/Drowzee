:- include('database.pl').
basketball_at_the_2000_summer_olympics(Start,End) :- begin('basketball_at_the_2000_summer_olympics',_,_,Start), end('basketball_at_the_2000_summer_olympics',_,_,End), Start=<End.

jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

generate_facts_basketball_at_the_2000_summer_olympics_OR_jonas([]) :- assert(basketball_at_the_2000_summer_olympics_OR_jonas(-1,-1)).

generate_facts_basketball_at_the_2000_summer_olympics_OR_jonas([(Start,End) | Tail]) :- assert(basketball_at_the_2000_summer_olympics_OR_jonas(Start,End)), generate_facts_basketball_at_the_2000_summer_olympics_OR_jonas(Tail).

basketball_at_the_2000_summer_olympics_OR_jonas_aux() :- findall((Start,End),basketball_at_the_2000_summer_olympics(Start,End),Interval1), findall((Start,End),jonas(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_basketball_at_the_2000_summer_olympics_OR_jonas(Interval).

basketball_at_the_2000_summer_olympics_OR_jonas_at_1939(Res) :- setof((Start,End),basketball_at_the_2000_summer_olympics_OR_jonas(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = basketball_at_the_2000_summer_olympics_OR_jonas_at_1939'), (basketball_at_the_2000_summer_olympics_OR_jonas_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- basketball_at_the_2000_summer_olympics_OR_jonas_aux().

