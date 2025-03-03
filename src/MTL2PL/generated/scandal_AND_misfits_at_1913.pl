:- include('database.pl').
scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

misfits(Start,End) :- begin('misfits',_,_,Start), end('misfits',_,_,End), Start=<End.

generate_facts_scandal_AND_misfits([]) :- assert(scandal_AND_misfits(-1,-1)).

generate_facts_scandal_AND_misfits([(Start,End) | Tail]) :- assert(scandal_AND_misfits(Start,End)), generate_facts_scandal_AND_misfits(Tail).

scandal_AND_misfits_aux() :- findall((Start,End),scandal(Start,End),Interval1), findall((Start,End),misfits(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scandal_AND_misfits(Interval).

scandal_AND_misfits_at_1913(Res) :- setof((Start,End),scandal_AND_misfits(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = scandal_AND_misfits_at_1913'), (scandal_AND_misfits_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scandal_AND_misfits_aux().

