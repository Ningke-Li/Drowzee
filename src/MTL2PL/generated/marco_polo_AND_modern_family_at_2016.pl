:- include('database.pl').
marco_polo(Start,End) :- begin('marco_polo',_,_,Start), end('marco_polo',_,_,End), Start=<End.

modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

generate_facts_marco_polo_AND_modern_family([]) :- assert(marco_polo_AND_modern_family(-1,-1)).

generate_facts_marco_polo_AND_modern_family([(Start,End) | Tail]) :- assert(marco_polo_AND_modern_family(Start,End)), generate_facts_marco_polo_AND_modern_family(Tail).

marco_polo_AND_modern_family_aux() :- findall((Start,End),marco_polo(Start,End),Interval1), findall((Start,End),modern_family(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_marco_polo_AND_modern_family(Interval).

marco_polo_AND_modern_family_at_2016(Res) :- setof((Start,End),marco_polo_AND_modern_family(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = marco_polo_AND_modern_family_at_2016'), (marco_polo_AND_modern_family_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- marco_polo_AND_modern_family_aux().

