:- include('database.pl').
brothers___sisters(Start,End) :- begin('brothers___sisters',_,_,Start), end('brothers___sisters',_,_,End), Start=<End.

ev_2007_copa_am_rica(Start,End) :- begin('ev_2007_copa_am_rica',_,_,Start), end('ev_2007_copa_am_rica',_,_,End), Start=<End.

generate_facts_brothers___sisters_OR_ev_2007_copa_am_rica([]) :- assert(brothers___sisters_OR_ev_2007_copa_am_rica(-1,-1)).

generate_facts_brothers___sisters_OR_ev_2007_copa_am_rica([(Start,End) | Tail]) :- assert(brothers___sisters_OR_ev_2007_copa_am_rica(Start,End)), generate_facts_brothers___sisters_OR_ev_2007_copa_am_rica(Tail).

brothers___sisters_OR_ev_2007_copa_am_rica_aux() :- findall((Start,End),brothers___sisters(Start,End),Interval1), findall((Start,End),ev_2007_copa_am_rica(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_brothers___sisters_OR_ev_2007_copa_am_rica(Interval).

brothers___sisters_OR_ev_2007_copa_am_rica_at_2058(Res) :- setof((Start,End),brothers___sisters_OR_ev_2007_copa_am_rica(Start,End),AllINtervals), checkvalidity(2058,AllINtervals,Res).

check_query() :- write('Query = brothers___sisters_OR_ev_2007_copa_am_rica_at_2058'), (brothers___sisters_OR_ev_2007_copa_am_rica_at_2058(true) -> write('\nRes   = true');write('\nRes   = false')).
?- brothers___sisters_OR_ev_2007_copa_am_rica_aux().

