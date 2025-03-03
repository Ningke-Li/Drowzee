:- include('database.pl').
i_love_lucy(Start,End) :- begin('i_love_lucy',_,_,Start), end('i_love_lucy',_,_,End), Start=<End.

ev_17th_century(Start,End) :- begin('ev_17th_century',_,_,Start), end('ev_17th_century',_,_,End), Start=<End.

generate_facts_i_love_lucy_OR_ev_17th_century([]) :- assert(i_love_lucy_OR_ev_17th_century(-1,-1)).

generate_facts_i_love_lucy_OR_ev_17th_century([(Start,End) | Tail]) :- assert(i_love_lucy_OR_ev_17th_century(Start,End)), generate_facts_i_love_lucy_OR_ev_17th_century(Tail).

i_love_lucy_OR_ev_17th_century_aux() :- findall((Start,End),i_love_lucy(Start,End),Interval1), findall((Start,End),ev_17th_century(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_i_love_lucy_OR_ev_17th_century(Interval).

i_love_lucy_OR_ev_17th_century_at_1606(Res) :- setof((Start,End),i_love_lucy_OR_ev_17th_century(Start,End),AllINtervals), checkvalidity(1606,AllINtervals,Res).

check_query() :- write('Query = i_love_lucy_OR_ev_17th_century_at_1606'), (i_love_lucy_OR_ev_17th_century_at_1606(true) -> write('\nRes   = true');write('\nRes   = false')).
?- i_love_lucy_OR_ev_17th_century_aux().

