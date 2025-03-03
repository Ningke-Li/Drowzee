:- include('database.pl').
ev_2001_copa_am_rica(Start,End) :- begin('ev_2001_copa_am_rica',_,_,Start), end('ev_2001_copa_am_rica',_,_,End), Start=<End.

hurricane_katrina(Start,End) :- begin('hurricane_katrina',_,_,Start), end('hurricane_katrina',_,_,End), Start=<End.

generate_facts_ev_2001_copa_am_rica_OR_hurricane_katrina([]) :- assert(ev_2001_copa_am_rica_OR_hurricane_katrina(-1,-1)).

generate_facts_ev_2001_copa_am_rica_OR_hurricane_katrina([(Start,End) | Tail]) :- assert(ev_2001_copa_am_rica_OR_hurricane_katrina(Start,End)), generate_facts_ev_2001_copa_am_rica_OR_hurricane_katrina(Tail).

ev_2001_copa_am_rica_OR_hurricane_katrina_aux() :- findall((Start,End),ev_2001_copa_am_rica(Start,End),Interval1), findall((Start,End),hurricane_katrina(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2001_copa_am_rica_OR_hurricane_katrina(Interval).

ev_2001_copa_am_rica_OR_hurricane_katrina_at_1913(Res) :- setof((Start,End),ev_2001_copa_am_rica_OR_hurricane_katrina(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = ev_2001_copa_am_rica_OR_hurricane_katrina_at_1913'), (ev_2001_copa_am_rica_OR_hurricane_katrina_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2001_copa_am_rica_OR_hurricane_katrina_aux().

