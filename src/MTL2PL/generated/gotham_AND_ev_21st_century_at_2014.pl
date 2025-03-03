:- include('database.pl').
gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

generate_facts_gotham_AND_ev_21st_century([]) :- assert(gotham_AND_ev_21st_century(-1,-1)).

generate_facts_gotham_AND_ev_21st_century([(Start,End) | Tail]) :- assert(gotham_AND_ev_21st_century(Start,End)), generate_facts_gotham_AND_ev_21st_century(Tail).

gotham_AND_ev_21st_century_aux() :- findall((Start,End),gotham(Start,End),Interval1), findall((Start,End),ev_21st_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_gotham_AND_ev_21st_century(Interval).

gotham_AND_ev_21st_century_at_2014(Res) :- setof((Start,End),gotham_AND_ev_21st_century(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = gotham_AND_ev_21st_century_at_2014'), (gotham_AND_ev_21st_century_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gotham_AND_ev_21st_century_aux().

