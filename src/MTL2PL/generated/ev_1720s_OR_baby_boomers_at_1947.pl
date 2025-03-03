:- include('database.pl').
ev_1720s(Start,End) :- begin('ev_1720s',_,_,Start), end('ev_1720s',_,_,End), Start=<End.

baby_boomers(Start,End) :- begin('baby_boomers',_,_,Start), end('baby_boomers',_,_,End), Start=<End.

generate_facts_ev_1720s_OR_baby_boomers([]) :- assert(ev_1720s_OR_baby_boomers(-1,-1)).

generate_facts_ev_1720s_OR_baby_boomers([(Start,End) | Tail]) :- assert(ev_1720s_OR_baby_boomers(Start,End)), generate_facts_ev_1720s_OR_baby_boomers(Tail).

ev_1720s_OR_baby_boomers_aux() :- findall((Start,End),ev_1720s(Start,End),Interval1), findall((Start,End),baby_boomers(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1720s_OR_baby_boomers(Interval).

ev_1720s_OR_baby_boomers_at_1947(Res) :- setof((Start,End),ev_1720s_OR_baby_boomers(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = ev_1720s_OR_baby_boomers_at_1947'), (ev_1720s_OR_baby_boomers_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1720s_OR_baby_boomers_aux().

