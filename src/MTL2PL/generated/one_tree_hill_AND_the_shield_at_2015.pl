:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

generate_facts_one_tree_hill_AND_the_shield([]) :- assert(one_tree_hill_AND_the_shield(-1,-1)).

generate_facts_one_tree_hill_AND_the_shield([(Start,End) | Tail]) :- assert(one_tree_hill_AND_the_shield(Start,End)), generate_facts_one_tree_hill_AND_the_shield(Tail).

one_tree_hill_AND_the_shield_aux() :- findall((Start,End),one_tree_hill(Start,End),Interval1), findall((Start,End),the_shield(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_one_tree_hill_AND_the_shield(Interval).

one_tree_hill_AND_the_shield_at_2015(Res) :- setof((Start,End),one_tree_hill_AND_the_shield(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = one_tree_hill_AND_the_shield_at_2015'), (one_tree_hill_AND_the_shield_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- one_tree_hill_AND_the_shield_aux().

