:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

khrushchev_thaw(Start,End) :- begin('khrushchev_thaw',_,_,Start), end('khrushchev_thaw',_,_,End), Start=<End.

generate_facts_bol_var_AND_khrushchev_thaw([]) :- assert(bol_var_AND_khrushchev_thaw(-1,-1)).

generate_facts_bol_var_AND_khrushchev_thaw([(Start,End) | Tail]) :- assert(bol_var_AND_khrushchev_thaw(Start,End)), generate_facts_bol_var_AND_khrushchev_thaw(Tail).

bol_var_AND_khrushchev_thaw_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),khrushchev_thaw(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_khrushchev_thaw(Interval).

bol_var_AND_khrushchev_thaw_at_1947(Res) :- setof((Start,End),bol_var_AND_khrushchev_thaw(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_khrushchev_thaw_at_1947'), (bol_var_AND_khrushchev_thaw_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_khrushchev_thaw_aux().

