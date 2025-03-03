:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

ev_2015_copa_am_rica(Start,End) :- begin('ev_2015_copa_am_rica',_,_,Start), end('ev_2015_copa_am_rica',_,_,End), Start=<End.

generate_facts_reign_OR_ev_2015_copa_am_rica([]) :- assert(reign_OR_ev_2015_copa_am_rica(-1,-1)).

generate_facts_reign_OR_ev_2015_copa_am_rica([(Start,End) | Tail]) :- assert(reign_OR_ev_2015_copa_am_rica(Start,End)), generate_facts_reign_OR_ev_2015_copa_am_rica(Tail).

reign_OR_ev_2015_copa_am_rica_aux() :- findall((Start,End),reign(Start,End),Interval1), findall((Start,End),ev_2015_copa_am_rica(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_reign_OR_ev_2015_copa_am_rica(Interval).

reign_OR_ev_2015_copa_am_rica_at_1962(Res) :- setof((Start,End),reign_OR_ev_2015_copa_am_rica(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = reign_OR_ev_2015_copa_am_rica_at_1962'), (reign_OR_ev_2015_copa_am_rica_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).
?- reign_OR_ev_2015_copa_am_rica_aux().

