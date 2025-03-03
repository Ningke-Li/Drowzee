:- include('database.pl').
basmachi_movement(Start,End) :- begin('basmachi_movement',_,_,Start), end('basmachi_movement',_,_,End), Start=<End.

taish__period(Start,End) :- begin('taish__period',_,_,Start), end('taish__period',_,_,End), Start=<End.

generate_facts_basmachi_movement_AND_taish__period([]) :- assert(basmachi_movement_AND_taish__period(-1,-1)).

generate_facts_basmachi_movement_AND_taish__period([(Start,End) | Tail]) :- assert(basmachi_movement_AND_taish__period(Start,End)), generate_facts_basmachi_movement_AND_taish__period(Tail).

basmachi_movement_AND_taish__period_aux() :- findall((Start,End),basmachi_movement(Start,End),Interval1), findall((Start,End),taish__period(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_basmachi_movement_AND_taish__period(Interval).

basmachi_movement_AND_taish__period_at_1885(Res) :- setof((Start,End),basmachi_movement_AND_taish__period(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = basmachi_movement_AND_taish__period_at_1885'), (basmachi_movement_AND_taish__period_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).
?- basmachi_movement_AND_taish__period_aux().

