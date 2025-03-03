:- include('database.pl').
ottoman_greece(Start,End) :- begin('ottoman_greece',_,_,Start), end('ottoman_greece',_,_,End), Start=<End.

manueline(Start,End) :- begin('manueline',_,_,Start), end('manueline',_,_,End), Start=<End.

generate_facts_ottoman_greece_AND_manueline([]) :- assert(ottoman_greece_AND_manueline(-1,-1)).

generate_facts_ottoman_greece_AND_manueline([(Start,End) | Tail]) :- assert(ottoman_greece_AND_manueline(Start,End)), generate_facts_ottoman_greece_AND_manueline(Tail).

ottoman_greece_AND_manueline_aux() :- findall((Start,End),ottoman_greece(Start,End),Interval1), findall((Start,End),manueline(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ottoman_greece_AND_manueline(Interval).

ottoman_greece_AND_manueline_at_1529(Res) :- setof((Start,End),ottoman_greece_AND_manueline(Start,End),AllINtervals), checkvalidity(1529,AllINtervals,Res).

check_query() :- write('Query = ottoman_greece_AND_manueline_at_1529'), (ottoman_greece_AND_manueline_at_1529(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ottoman_greece_AND_manueline_aux().

