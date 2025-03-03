:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

revenge(Start,End) :- begin('revenge',_,_,Start), end('revenge',_,_,End), Start=<End.

generate_facts_one_tree_hill_AND_revenge([]) :- assert(one_tree_hill_AND_revenge(-1,-1)).

generate_facts_one_tree_hill_AND_revenge([(Start,End) | Tail]) :- assert(one_tree_hill_AND_revenge(Start,End)), generate_facts_one_tree_hill_AND_revenge(Tail).

one_tree_hill_AND_revenge_aux() :- findall((Start,End),one_tree_hill(Start,End),Interval1), findall((Start,End),revenge(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_one_tree_hill_AND_revenge(Interval).

one_tree_hill_AND_revenge_at_2011(Res) :- setof((Start,End),one_tree_hill_AND_revenge(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = one_tree_hill_AND_revenge_at_2011'), (one_tree_hill_AND_revenge_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- one_tree_hill_AND_revenge_aux().

