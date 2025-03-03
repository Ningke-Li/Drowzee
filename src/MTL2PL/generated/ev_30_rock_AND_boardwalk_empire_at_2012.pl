:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

boardwalk_empire(Start,End) :- begin('boardwalk_empire',_,_,Start), end('boardwalk_empire',_,_,End), Start=<End.

generate_facts_ev_30_rock_AND_boardwalk_empire([]) :- assert(ev_30_rock_AND_boardwalk_empire(-1,-1)).

generate_facts_ev_30_rock_AND_boardwalk_empire([(Start,End) | Tail]) :- assert(ev_30_rock_AND_boardwalk_empire(Start,End)), generate_facts_ev_30_rock_AND_boardwalk_empire(Tail).

ev_30_rock_AND_boardwalk_empire_aux() :- findall((Start,End),ev_30_rock(Start,End),Interval1), findall((Start,End),boardwalk_empire(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_30_rock_AND_boardwalk_empire(Interval).

ev_30_rock_AND_boardwalk_empire_at_2012(Res) :- setof((Start,End),ev_30_rock_AND_boardwalk_empire(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = ev_30_rock_AND_boardwalk_empire_at_2012'), (ev_30_rock_AND_boardwalk_empire_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_30_rock_AND_boardwalk_empire_aux().

