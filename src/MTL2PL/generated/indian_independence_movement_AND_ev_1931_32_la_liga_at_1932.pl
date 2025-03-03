:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

ev_1931_32_la_liga(Start,End) :- begin('ev_1931_32_la_liga',_,_,Start), end('ev_1931_32_la_liga',_,_,End), Start=<End.

generate_facts_indian_independence_movement_AND_ev_1931_32_la_liga([]) :- assert(indian_independence_movement_AND_ev_1931_32_la_liga(-1,-1)).

generate_facts_indian_independence_movement_AND_ev_1931_32_la_liga([(Start,End) | Tail]) :- assert(indian_independence_movement_AND_ev_1931_32_la_liga(Start,End)), generate_facts_indian_independence_movement_AND_ev_1931_32_la_liga(Tail).

indian_independence_movement_AND_ev_1931_32_la_liga_aux() :- findall((Start,End),indian_independence_movement(Start,End),Interval1), findall((Start,End),ev_1931_32_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_indian_independence_movement_AND_ev_1931_32_la_liga(Interval).

indian_independence_movement_AND_ev_1931_32_la_liga_at_1932(Res) :- setof((Start,End),indian_independence_movement_AND_ev_1931_32_la_liga(Start,End),AllINtervals), checkvalidity(1932,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_AND_ev_1931_32_la_liga_at_1932'), (indian_independence_movement_AND_ev_1931_32_la_liga_at_1932(true) -> write('\nRes   = true');write('\nRes   = false')).
?- indian_independence_movement_AND_ev_1931_32_la_liga_aux().

