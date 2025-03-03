:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

generate_facts_mythbusters_AND_csi__ny([]) :- assert(mythbusters_AND_csi__ny(-1,-1)).

generate_facts_mythbusters_AND_csi__ny([(Start,End) | Tail]) :- assert(mythbusters_AND_csi__ny(Start,End)), generate_facts_mythbusters_AND_csi__ny(Tail).

mythbusters_AND_csi__ny_aux() :- findall((Start,End),mythbusters(Start,End),Interval1), findall((Start,End),csi__ny(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mythbusters_AND_csi__ny(Interval).

mythbusters_AND_csi__ny_at_2011(Res) :- setof((Start,End),mythbusters_AND_csi__ny(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = mythbusters_AND_csi__ny_at_2011'), (mythbusters_AND_csi__ny_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mythbusters_AND_csi__ny_aux().

