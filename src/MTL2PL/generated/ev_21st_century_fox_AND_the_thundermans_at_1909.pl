:- include('database.pl').
ev_21st_century_fox(Start,End) :- begin('ev_21st_century_fox',_,_,Start), end('ev_21st_century_fox',_,_,End), Start=<End.

the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

generate_facts_ev_21st_century_fox_AND_the_thundermans([]) :- assert(ev_21st_century_fox_AND_the_thundermans(-1,-1)).

generate_facts_ev_21st_century_fox_AND_the_thundermans([(Start,End) | Tail]) :- assert(ev_21st_century_fox_AND_the_thundermans(Start,End)), generate_facts_ev_21st_century_fox_AND_the_thundermans(Tail).

ev_21st_century_fox_AND_the_thundermans_aux() :- findall((Start,End),ev_21st_century_fox(Start,End),Interval1), findall((Start,End),the_thundermans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_21st_century_fox_AND_the_thundermans(Interval).

ev_21st_century_fox_AND_the_thundermans_at_1909(Res) :- setof((Start,End),ev_21st_century_fox_AND_the_thundermans(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = ev_21st_century_fox_AND_the_thundermans_at_1909'), (ev_21st_century_fox_AND_the_thundermans_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_21st_century_fox_AND_the_thundermans_aux().

