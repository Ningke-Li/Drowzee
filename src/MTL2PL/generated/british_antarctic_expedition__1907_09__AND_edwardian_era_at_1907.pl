:- include('database.pl').
british_antarctic_expedition__1907_09_(Start,End) :- begin('british_antarctic_expedition__1907_09_',_,_,Start), end('british_antarctic_expedition__1907_09_',_,_,End), Start=<End.

edwardian_era(Start,End) :- begin('edwardian_era',_,_,Start), end('edwardian_era',_,_,End), Start=<End.

generate_facts_british_antarctic_expedition__1907_09__AND_edwardian_era([]) :- assert(british_antarctic_expedition__1907_09__AND_edwardian_era(-1,-1)).

generate_facts_british_antarctic_expedition__1907_09__AND_edwardian_era([(Start,End) | Tail]) :- assert(british_antarctic_expedition__1907_09__AND_edwardian_era(Start,End)), generate_facts_british_antarctic_expedition__1907_09__AND_edwardian_era(Tail).

british_antarctic_expedition__1907_09__AND_edwardian_era_aux() :- findall((Start,End),british_antarctic_expedition__1907_09_(Start,End),Interval1), findall((Start,End),edwardian_era(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_british_antarctic_expedition__1907_09__AND_edwardian_era(Interval).

british_antarctic_expedition__1907_09__AND_edwardian_era_at_1907(Res) :- setof((Start,End),british_antarctic_expedition__1907_09__AND_edwardian_era(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = british_antarctic_expedition__1907_09__AND_edwardian_era_at_1907'), (british_antarctic_expedition__1907_09__AND_edwardian_era_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).
?- british_antarctic_expedition__1907_09__AND_edwardian_era_aux().

