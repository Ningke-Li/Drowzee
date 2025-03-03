:- include('database.pl').
tunisian_revolution(Start,End) :- begin('tunisian_revolution',_,_,Start), end('tunisian_revolution',_,_,End), Start=<End.

modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

generate_facts_tunisian_revolution_AND_modern_family([]) :- assert(tunisian_revolution_AND_modern_family(-1,-1)).

generate_facts_tunisian_revolution_AND_modern_family([(Start,End) | Tail]) :- assert(tunisian_revolution_AND_modern_family(Start,End)), generate_facts_tunisian_revolution_AND_modern_family(Tail).

tunisian_revolution_AND_modern_family_aux() :- findall((Start,End),tunisian_revolution(Start,End),Interval1), findall((Start,End),modern_family(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_tunisian_revolution_AND_modern_family(Interval).

tunisian_revolution_AND_modern_family_at_2011(Res) :- setof((Start,End),tunisian_revolution_AND_modern_family(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = tunisian_revolution_AND_modern_family_at_2011'), (tunisian_revolution_AND_modern_family_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tunisian_revolution_AND_modern_family_aux().

