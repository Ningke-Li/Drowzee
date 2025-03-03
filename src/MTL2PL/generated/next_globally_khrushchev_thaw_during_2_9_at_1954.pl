:- include('database.pl').
khrushchev_thaw(Start,End) :- begin('khrushchev_thaw',_,_,Start), end('khrushchev_thaw',_,_,End), Start=<End.

globally_khrushchev_thaw_during_2_9(Start,End) :- khrushchev_thaw(Start1,End1), Start is (Start1-2), End is (End1-9), Start=<End.

next_globally_khrushchev_thaw_during_2_9(Start,End) :- globally_khrushchev_thaw_during_2_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_khrushchev_thaw_during_2_9_at_1954(Res) :- setof((Start,End),next_globally_khrushchev_thaw_during_2_9(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = next_globally_khrushchev_thaw_during_2_9_at_1954'), (next_globally_khrushchev_thaw_during_2_9_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

