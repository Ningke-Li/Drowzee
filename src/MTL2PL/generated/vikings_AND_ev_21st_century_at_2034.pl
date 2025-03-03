:- include('database.pl').
vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

generate_facts_vikings_AND_ev_21st_century([]) :- assert(vikings_AND_ev_21st_century(-1,-1)).

generate_facts_vikings_AND_ev_21st_century([(Start,End) | Tail]) :- assert(vikings_AND_ev_21st_century(Start,End)), generate_facts_vikings_AND_ev_21st_century(Tail).

vikings_AND_ev_21st_century_aux() :- findall((Start,End),vikings(Start,End),Interval1), findall((Start,End),ev_21st_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_vikings_AND_ev_21st_century(Interval).

vikings_AND_ev_21st_century_at_2034(Res) :- setof((Start,End),vikings_AND_ev_21st_century(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = vikings_AND_ev_21st_century_at_2034'), (vikings_AND_ev_21st_century_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).
?- vikings_AND_ev_21st_century_aux().

