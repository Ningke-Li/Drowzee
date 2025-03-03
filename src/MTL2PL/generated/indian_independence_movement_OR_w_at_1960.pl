:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

w(Start,End) :- begin('w',_,_,Start), end('w',_,_,End), Start=<End.

generate_facts_indian_independence_movement_OR_w([]) :- assert(indian_independence_movement_OR_w(-1,-1)).

generate_facts_indian_independence_movement_OR_w([(Start,End) | Tail]) :- assert(indian_independence_movement_OR_w(Start,End)), generate_facts_indian_independence_movement_OR_w(Tail).

indian_independence_movement_OR_w_aux() :- findall((Start,End),indian_independence_movement(Start,End),Interval1), findall((Start,End),w(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_indian_independence_movement_OR_w(Interval).

indian_independence_movement_OR_w_at_1960(Res) :- setof((Start,End),indian_independence_movement_OR_w(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_OR_w_at_1960'), (indian_independence_movement_OR_w_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- indian_independence_movement_OR_w_aux().

