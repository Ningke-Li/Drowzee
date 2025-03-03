:- include('database.pl').
white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

khrushchev_thaw(Start,End) :- begin('khrushchev_thaw',_,_,Start), end('khrushchev_thaw',_,_,End), Start=<End.

generate_facts_white_collar_OR_khrushchev_thaw([]) :- assert(white_collar_OR_khrushchev_thaw(-1,-1)).

generate_facts_white_collar_OR_khrushchev_thaw([(Start,End) | Tail]) :- assert(white_collar_OR_khrushchev_thaw(Start,End)), generate_facts_white_collar_OR_khrushchev_thaw(Tail).

white_collar_OR_khrushchev_thaw_aux() :- findall((Start,End),white_collar(Start,End),Interval1), findall((Start,End),khrushchev_thaw(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_white_collar_OR_khrushchev_thaw(Interval).

white_collar_OR_khrushchev_thaw_at_1874(Res) :- setof((Start,End),white_collar_OR_khrushchev_thaw(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = white_collar_OR_khrushchev_thaw_at_1874'), (white_collar_OR_khrushchev_thaw_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- white_collar_OR_khrushchev_thaw_aux().

