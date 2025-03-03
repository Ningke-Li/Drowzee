:- include('database.pl').
orphan_black(Start,End) :- begin('orphan_black',_,_,Start), end('orphan_black',_,_,End), Start=<End.

ev_2013_14_la_liga(Start,End) :- begin('ev_2013_14_la_liga',_,_,Start), end('ev_2013_14_la_liga',_,_,End), Start=<End.

generate_facts_orphan_black_AND_ev_2013_14_la_liga([]) :- assert(orphan_black_AND_ev_2013_14_la_liga(-1,-1)).

generate_facts_orphan_black_AND_ev_2013_14_la_liga([(Start,End) | Tail]) :- assert(orphan_black_AND_ev_2013_14_la_liga(Start,End)), generate_facts_orphan_black_AND_ev_2013_14_la_liga(Tail).

orphan_black_AND_ev_2013_14_la_liga_aux() :- findall((Start,End),orphan_black(Start,End),Interval1), findall((Start,End),ev_2013_14_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orphan_black_AND_ev_2013_14_la_liga(Interval).

orphan_black_AND_ev_2013_14_la_liga_at_1969(Res) :- setof((Start,End),orphan_black_AND_ev_2013_14_la_liga(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = orphan_black_AND_ev_2013_14_la_liga_at_1969'), (orphan_black_AND_ev_2013_14_la_liga_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orphan_black_AND_ev_2013_14_la_liga_aux().

