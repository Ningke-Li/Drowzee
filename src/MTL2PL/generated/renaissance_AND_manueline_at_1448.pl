:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

manueline(Start,End) :- begin('manueline',_,_,Start), end('manueline',_,_,End), Start=<End.

generate_facts_renaissance_AND_manueline([]) :- assert(renaissance_AND_manueline(-1,-1)).

generate_facts_renaissance_AND_manueline([(Start,End) | Tail]) :- assert(renaissance_AND_manueline(Start,End)), generate_facts_renaissance_AND_manueline(Tail).

renaissance_AND_manueline_aux() :- findall((Start,End),renaissance(Start,End),Interval1), findall((Start,End),manueline(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_renaissance_AND_manueline(Interval).

renaissance_AND_manueline_at_1448(Res) :- setof((Start,End),renaissance_AND_manueline(Start,End),AllINtervals), checkvalidity(1448,AllINtervals,Res).

check_query() :- write('Query = renaissance_AND_manueline_at_1448'), (renaissance_AND_manueline_at_1448(true) -> write('\nRes   = true');write('\nRes   = false')).
?- renaissance_AND_manueline_aux().

