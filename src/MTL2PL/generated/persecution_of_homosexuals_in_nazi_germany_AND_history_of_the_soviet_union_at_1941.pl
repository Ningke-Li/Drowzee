:- include('database.pl').
persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union([]) :- assert(persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union(-1,-1)).

generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union([(Start,End) | Tail]) :- assert(persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union(Start,End)), generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union(Tail).

persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union_aux() :- findall((Start,End),persecution_of_homosexuals_in_nazi_germany(Start,End),Interval1), findall((Start,End),history_of_the_soviet_union(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union(Interval).

persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union_at_1941(Res) :- setof((Start,End),persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union_at_1941'), (persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- persecution_of_homosexuals_in_nazi_germany_AND_history_of_the_soviet_union_aux().

