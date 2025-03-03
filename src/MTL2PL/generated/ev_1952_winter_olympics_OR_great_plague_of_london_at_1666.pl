:- include('database.pl').
ev_1952_winter_olympics(Start,End) :- begin('ev_1952_winter_olympics',_,_,Start), end('ev_1952_winter_olympics',_,_,End), Start=<End.

great_plague_of_london(Start,End) :- begin('great_plague_of_london',_,_,Start), end('great_plague_of_london',_,_,End), Start=<End.

generate_facts_ev_1952_winter_olympics_OR_great_plague_of_london([]) :- assert(ev_1952_winter_olympics_OR_great_plague_of_london(-1,-1)).

generate_facts_ev_1952_winter_olympics_OR_great_plague_of_london([(Start,End) | Tail]) :- assert(ev_1952_winter_olympics_OR_great_plague_of_london(Start,End)), generate_facts_ev_1952_winter_olympics_OR_great_plague_of_london(Tail).

ev_1952_winter_olympics_OR_great_plague_of_london_aux() :- findall((Start,End),ev_1952_winter_olympics(Start,End),Interval1), findall((Start,End),great_plague_of_london(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1952_winter_olympics_OR_great_plague_of_london(Interval).

ev_1952_winter_olympics_OR_great_plague_of_london_at_1666(Res) :- setof((Start,End),ev_1952_winter_olympics_OR_great_plague_of_london(Start,End),AllINtervals), checkvalidity(1666,AllINtervals,Res).

check_query() :- write('Query = ev_1952_winter_olympics_OR_great_plague_of_london_at_1666'), (ev_1952_winter_olympics_OR_great_plague_of_london_at_1666(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1952_winter_olympics_OR_great_plague_of_london_aux().

