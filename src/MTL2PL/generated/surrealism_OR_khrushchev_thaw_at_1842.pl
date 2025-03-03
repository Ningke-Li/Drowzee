:- include('database.pl').
surrealism(Start,End) :- begin('surrealism',_,_,Start), end('surrealism',_,_,End), Start=<End.

khrushchev_thaw(Start,End) :- begin('khrushchev_thaw',_,_,Start), end('khrushchev_thaw',_,_,End), Start=<End.

generate_facts_surrealism_OR_khrushchev_thaw([]) :- assert(surrealism_OR_khrushchev_thaw(-1,-1)).

generate_facts_surrealism_OR_khrushchev_thaw([(Start,End) | Tail]) :- assert(surrealism_OR_khrushchev_thaw(Start,End)), generate_facts_surrealism_OR_khrushchev_thaw(Tail).

surrealism_OR_khrushchev_thaw_aux() :- findall((Start,End),surrealism(Start,End),Interval1), findall((Start,End),khrushchev_thaw(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_surrealism_OR_khrushchev_thaw(Interval).

surrealism_OR_khrushchev_thaw_at_1842(Res) :- setof((Start,End),surrealism_OR_khrushchev_thaw(Start,End),AllINtervals), checkvalidity(1842,AllINtervals,Res).

check_query() :- write('Query = surrealism_OR_khrushchev_thaw_at_1842'), (surrealism_OR_khrushchev_thaw_at_1842(true) -> write('\nRes   = true');write('\nRes   = false')).
?- surrealism_OR_khrushchev_thaw_aux().

