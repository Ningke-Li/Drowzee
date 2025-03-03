:- include('database.pl').
merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

cuban_war_of_independence(Start,End) :- begin('cuban_war_of_independence',_,_,Start), end('cuban_war_of_independence',_,_,End), Start=<End.

generate_facts_merlin_OR_cuban_war_of_independence([]) :- assert(merlin_OR_cuban_war_of_independence(-1,-1)).

generate_facts_merlin_OR_cuban_war_of_independence([(Start,End) | Tail]) :- assert(merlin_OR_cuban_war_of_independence(Start,End)), generate_facts_merlin_OR_cuban_war_of_independence(Tail).

merlin_OR_cuban_war_of_independence_aux() :- findall((Start,End),merlin(Start,End),Interval1), findall((Start,End),cuban_war_of_independence(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_merlin_OR_cuban_war_of_independence(Interval).

merlin_OR_cuban_war_of_independence_at_1865(Res) :- setof((Start,End),merlin_OR_cuban_war_of_independence(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = merlin_OR_cuban_war_of_independence_at_1865'), (merlin_OR_cuban_war_of_independence_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).
?- merlin_OR_cuban_war_of_independence_aux().

