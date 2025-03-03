:- include('database.pl').
ev_1936_winter_olympics(Start,End) :- begin('ev_1936_winter_olympics',_,_,Start), end('ev_1936_winter_olympics',_,_,End), Start=<End.

sputnik_programme(Start,End) :- begin('sputnik_programme',_,_,Start), end('sputnik_programme',_,_,End), Start=<End.

generate_facts_ev_1936_winter_olympics_OR_sputnik_programme([]) :- assert(ev_1936_winter_olympics_OR_sputnik_programme(-1,-1)).

generate_facts_ev_1936_winter_olympics_OR_sputnik_programme([(Start,End) | Tail]) :- assert(ev_1936_winter_olympics_OR_sputnik_programme(Start,End)), generate_facts_ev_1936_winter_olympics_OR_sputnik_programme(Tail).

ev_1936_winter_olympics_OR_sputnik_programme_aux() :- findall((Start,End),ev_1936_winter_olympics(Start,End),Interval1), findall((Start,End),sputnik_programme(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1936_winter_olympics_OR_sputnik_programme(Interval).

ev_1936_winter_olympics_OR_sputnik_programme_at_1870(Res) :- setof((Start,End),ev_1936_winter_olympics_OR_sputnik_programme(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = ev_1936_winter_olympics_OR_sputnik_programme_at_1870'), (ev_1936_winter_olympics_OR_sputnik_programme_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1936_winter_olympics_OR_sputnik_programme_aux().

