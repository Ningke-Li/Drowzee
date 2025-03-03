:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

mole(Start,End) :- begin('mole',_,_,Start), end('mole',_,_,End), Start=<End.

generate_facts_man_vs__wild_OR_mole([]) :- assert(man_vs__wild_OR_mole(-1,-1)).

generate_facts_man_vs__wild_OR_mole([(Start,End) | Tail]) :- assert(man_vs__wild_OR_mole(Start,End)), generate_facts_man_vs__wild_OR_mole(Tail).

man_vs__wild_OR_mole_aux() :- findall((Start,End),man_vs__wild(Start,End),Interval1), findall((Start,End),mole(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_man_vs__wild_OR_mole(Interval).

man_vs__wild_OR_mole_at_1928(Res) :- setof((Start,End),man_vs__wild_OR_mole(Start,End),AllINtervals), checkvalidity(1928,AllINtervals,Res).

check_query() :- write('Query = man_vs__wild_OR_mole_at_1928'), (man_vs__wild_OR_mole_at_1928(true) -> write('\nRes   = true');write('\nRes   = false')).
?- man_vs__wild_OR_mole_aux().

