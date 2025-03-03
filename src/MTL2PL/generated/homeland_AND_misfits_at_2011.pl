:- include('database.pl').
homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

misfits(Start,End) :- begin('misfits',_,_,Start), end('misfits',_,_,End), Start=<End.

generate_facts_homeland_AND_misfits([]) :- assert(homeland_AND_misfits(-1,-1)).

generate_facts_homeland_AND_misfits([(Start,End) | Tail]) :- assert(homeland_AND_misfits(Start,End)), generate_facts_homeland_AND_misfits(Tail).

homeland_AND_misfits_aux() :- findall((Start,End),homeland(Start,End),Interval1), findall((Start,End),misfits(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_homeland_AND_misfits(Interval).

homeland_AND_misfits_at_2011(Res) :- setof((Start,End),homeland_AND_misfits(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = homeland_AND_misfits_at_2011'), (homeland_AND_misfits_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- homeland_AND_misfits_aux().

