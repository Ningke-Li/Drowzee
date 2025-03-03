:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

generate_facts_ev_21st_century_AND_magnificent_century([]) :- assert(ev_21st_century_AND_magnificent_century(-1,-1)).

generate_facts_ev_21st_century_AND_magnificent_century([(Start,End) | Tail]) :- assert(ev_21st_century_AND_magnificent_century(Start,End)), generate_facts_ev_21st_century_AND_magnificent_century(Tail).

ev_21st_century_AND_magnificent_century_aux() :- findall((Start,End),ev_21st_century(Start,End),Interval1), findall((Start,End),magnificent_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_21st_century_AND_magnificent_century(Interval).

ev_21st_century_AND_magnificent_century_at_1944(Res) :- setof((Start,End),ev_21st_century_AND_magnificent_century(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = ev_21st_century_AND_magnificent_century_at_1944'), (ev_21st_century_AND_magnificent_century_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_21st_century_AND_magnificent_century_aux().

