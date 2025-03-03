:- include('database.pl').
persecution_of_homosexuals_in_nazi_germany(Start,End) :- begin('persecution_of_homosexuals_in_nazi_germany',_,_,Start), end('persecution_of_homosexuals_in_nazi_germany',_,_,End), Start=<End.

indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement([]) :- assert(persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement(-1,-1)).

generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement([(Start,End) | Tail]) :- assert(persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement(Start,End)), generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement(Tail).

persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement_aux() :- findall((Start,End),persecution_of_homosexuals_in_nazi_germany(Start,End),Interval1), findall((Start,End),indian_independence_movement(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement(Interval).

persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement_at_1863(Res) :- setof((Start,End),persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement_at_1863'), (persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- persecution_of_homosexuals_in_nazi_germany_AND_indian_independence_movement_aux().

