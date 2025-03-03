:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

generate_facts_top_gear_OR_indian_independence_movement([]) :- assert(top_gear_OR_indian_independence_movement(-1,-1)).

generate_facts_top_gear_OR_indian_independence_movement([(Start,End) | Tail]) :- assert(top_gear_OR_indian_independence_movement(Start,End)), generate_facts_top_gear_OR_indian_independence_movement(Tail).

top_gear_OR_indian_independence_movement_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),indian_independence_movement(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_top_gear_OR_indian_independence_movement(Interval).

top_gear_OR_indian_independence_movement_at_1857(Res) :- setof((Start,End),top_gear_OR_indian_independence_movement(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = top_gear_OR_indian_independence_movement_at_1857'), (top_gear_OR_indian_independence_movement_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_OR_indian_independence_movement_aux().

