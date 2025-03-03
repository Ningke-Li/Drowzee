:- include('database.pl').
ev_2009(Start,End) :- begin('ev_2009',_,_,Start), end('ev_2009',_,_,End), Start=<End.

ev_1904_summer_olympics(Start,End) :- begin('ev_1904_summer_olympics',_,_,Start), end('ev_1904_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2009_OR_ev_1904_summer_olympics([]) :- assert(ev_2009_OR_ev_1904_summer_olympics(-1,-1)).

generate_facts_ev_2009_OR_ev_1904_summer_olympics([(Start,End) | Tail]) :- assert(ev_2009_OR_ev_1904_summer_olympics(Start,End)), generate_facts_ev_2009_OR_ev_1904_summer_olympics(Tail).

ev_2009_OR_ev_1904_summer_olympics_aux() :- findall((Start,End),ev_2009(Start,End),Interval1), findall((Start,End),ev_1904_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_OR_ev_1904_summer_olympics(Interval).

ev_2009_OR_ev_1904_summer_olympics_at_1904(Res) :- setof((Start,End),ev_2009_OR_ev_1904_summer_olympics(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = ev_2009_OR_ev_1904_summer_olympics_at_1904'), (ev_2009_OR_ev_1904_summer_olympics_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_OR_ev_1904_summer_olympics_aux().

