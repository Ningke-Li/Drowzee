:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

ev_2010_winter_olympics(Start,End) :- begin('ev_2010_winter_olympics',_,_,Start), end('ev_2010_winter_olympics',_,_,End), Start=<End.

generate_facts_harry_potter_OR_ev_2010_winter_olympics([]) :- assert(harry_potter_OR_ev_2010_winter_olympics(-1,-1)).

generate_facts_harry_potter_OR_ev_2010_winter_olympics([(Start,End) | Tail]) :- assert(harry_potter_OR_ev_2010_winter_olympics(Start,End)), generate_facts_harry_potter_OR_ev_2010_winter_olympics(Tail).

harry_potter_OR_ev_2010_winter_olympics_aux() :- findall((Start,End),harry_potter(Start,End),Interval1), findall((Start,End),ev_2010_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_harry_potter_OR_ev_2010_winter_olympics(Interval).

harry_potter_OR_ev_2010_winter_olympics_at_2035(Res) :- setof((Start,End),harry_potter_OR_ev_2010_winter_olympics(Start,End),AllINtervals), checkvalidity(2035,AllINtervals,Res).

check_query() :- write('Query = harry_potter_OR_ev_2010_winter_olympics_at_2035'), (harry_potter_OR_ev_2010_winter_olympics_at_2035(true) -> write('\nRes   = true');write('\nRes   = false')).
?- harry_potter_OR_ev_2010_winter_olympics_aux().

