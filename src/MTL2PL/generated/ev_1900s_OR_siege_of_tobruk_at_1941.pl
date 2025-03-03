:- include('database.pl').
ev_1900s(Start,End) :- begin('ev_1900s',_,_,Start), end('ev_1900s',_,_,End), Start=<End.

siege_of_tobruk(Start,End) :- begin('siege_of_tobruk',_,_,Start), end('siege_of_tobruk',_,_,End), Start=<End.

generate_facts_ev_1900s_OR_siege_of_tobruk([]) :- assert(ev_1900s_OR_siege_of_tobruk(-1,-1)).

generate_facts_ev_1900s_OR_siege_of_tobruk([(Start,End) | Tail]) :- assert(ev_1900s_OR_siege_of_tobruk(Start,End)), generate_facts_ev_1900s_OR_siege_of_tobruk(Tail).

ev_1900s_OR_siege_of_tobruk_aux() :- findall((Start,End),ev_1900s(Start,End),Interval1), findall((Start,End),siege_of_tobruk(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1900s_OR_siege_of_tobruk(Interval).

ev_1900s_OR_siege_of_tobruk_at_1941(Res) :- setof((Start,End),ev_1900s_OR_siege_of_tobruk(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = ev_1900s_OR_siege_of_tobruk_at_1941'), (ev_1900s_OR_siege_of_tobruk_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1900s_OR_siege_of_tobruk_aux().

