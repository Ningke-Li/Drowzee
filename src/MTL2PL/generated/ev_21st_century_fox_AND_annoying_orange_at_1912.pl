:- include('database.pl').
ev_21st_century_fox(Start,End) :- begin('ev_21st_century_fox',_,_,Start), end('ev_21st_century_fox',_,_,End), Start=<End.

annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

generate_facts_ev_21st_century_fox_AND_annoying_orange([]) :- assert(ev_21st_century_fox_AND_annoying_orange(-1,-1)).

generate_facts_ev_21st_century_fox_AND_annoying_orange([(Start,End) | Tail]) :- assert(ev_21st_century_fox_AND_annoying_orange(Start,End)), generate_facts_ev_21st_century_fox_AND_annoying_orange(Tail).

ev_21st_century_fox_AND_annoying_orange_aux() :- findall((Start,End),ev_21st_century_fox(Start,End),Interval1), findall((Start,End),annoying_orange(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_21st_century_fox_AND_annoying_orange(Interval).

ev_21st_century_fox_AND_annoying_orange_at_1912(Res) :- setof((Start,End),ev_21st_century_fox_AND_annoying_orange(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = ev_21st_century_fox_AND_annoying_orange_at_1912'), (ev_21st_century_fox_AND_annoying_orange_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_21st_century_fox_AND_annoying_orange_aux().

