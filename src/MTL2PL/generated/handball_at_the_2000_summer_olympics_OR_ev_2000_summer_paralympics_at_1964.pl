:- include('database.pl').
handball_at_the_2000_summer_olympics(Start,End) :- begin('handball_at_the_2000_summer_olympics',_,_,Start), end('handball_at_the_2000_summer_olympics',_,_,End), Start=<End.

ev_2000_summer_paralympics(Start,End) :- begin('ev_2000_summer_paralympics',_,_,Start), end('ev_2000_summer_paralympics',_,_,End), Start=<End.

generate_facts_handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics([]) :- assert(handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics(-1,-1)).

generate_facts_handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics([(Start,End) | Tail]) :- assert(handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics(Start,End)), generate_facts_handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics(Tail).

handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics_aux() :- findall((Start,End),handball_at_the_2000_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2000_summer_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics(Interval).

handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics_at_1964(Res) :- setof((Start,End),handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics_at_1964'), (handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics_at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).
?- handball_at_the_2000_summer_olympics_OR_ev_2000_summer_paralympics_aux().

