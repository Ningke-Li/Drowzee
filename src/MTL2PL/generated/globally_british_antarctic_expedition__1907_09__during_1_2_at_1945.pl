:- include('database.pl').
british_antarctic_expedition__1907_09_(Start,End) :- begin('british_antarctic_expedition__1907_09_',_,_,Start), end('british_antarctic_expedition__1907_09_',_,_,End), Start=<End.

globally_british_antarctic_expedition__1907_09__during_1_2(Start,End) :- british_antarctic_expedition__1907_09_(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_british_antarctic_expedition__1907_09__during_1_2_at_1945(Res) :- setof((Start,End),globally_british_antarctic_expedition__1907_09__during_1_2(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = globally_british_antarctic_expedition__1907_09__during_1_2_at_1945'), (globally_british_antarctic_expedition__1907_09__during_1_2_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).

