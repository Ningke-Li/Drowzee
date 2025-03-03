:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

ev_2005_06_la_liga(Start,End) :- begin('ev_2005_06_la_liga',_,_,Start), end('ev_2005_06_la_liga',_,_,End), Start=<End.

generate_facts_csi__miami_AND_ev_2005_06_la_liga([]) :- assert(csi__miami_AND_ev_2005_06_la_liga(-1,-1)).

generate_facts_csi__miami_AND_ev_2005_06_la_liga([(Start,End) | Tail]) :- assert(csi__miami_AND_ev_2005_06_la_liga(Start,End)), generate_facts_csi__miami_AND_ev_2005_06_la_liga(Tail).

csi__miami_AND_ev_2005_06_la_liga_aux() :- findall((Start,End),csi__miami(Start,End),Interval1), findall((Start,End),ev_2005_06_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_csi__miami_AND_ev_2005_06_la_liga(Interval).

csi__miami_AND_ev_2005_06_la_liga_at_2020(Res) :- setof((Start,End),csi__miami_AND_ev_2005_06_la_liga(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = csi__miami_AND_ev_2005_06_la_liga_at_2020'), (csi__miami_AND_ev_2005_06_la_liga_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- csi__miami_AND_ev_2005_06_la_liga_aux().

