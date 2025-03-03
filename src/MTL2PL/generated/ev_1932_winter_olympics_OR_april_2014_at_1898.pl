:- include('database.pl').
ev_1932_winter_olympics(Start,End) :- begin('ev_1932_winter_olympics',_,_,Start), end('ev_1932_winter_olympics',_,_,End), Start=<End.

april_2014(Start,End) :- begin('april_2014',_,_,Start), end('april_2014',_,_,End), Start=<End.

generate_facts_ev_1932_winter_olympics_OR_april_2014([]) :- assert(ev_1932_winter_olympics_OR_april_2014(-1,-1)).

generate_facts_ev_1932_winter_olympics_OR_april_2014([(Start,End) | Tail]) :- assert(ev_1932_winter_olympics_OR_april_2014(Start,End)), generate_facts_ev_1932_winter_olympics_OR_april_2014(Tail).

ev_1932_winter_olympics_OR_april_2014_aux() :- findall((Start,End),ev_1932_winter_olympics(Start,End),Interval1), findall((Start,End),april_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1932_winter_olympics_OR_april_2014(Interval).

ev_1932_winter_olympics_OR_april_2014_at_1898(Res) :- setof((Start,End),ev_1932_winter_olympics_OR_april_2014(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = ev_1932_winter_olympics_OR_april_2014_at_1898'), (ev_1932_winter_olympics_OR_april_2014_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1932_winter_olympics_OR_april_2014_aux().

