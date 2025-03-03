:- include('database.pl').
total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

globally_total_drama_island_during_1_2(Start,End) :- total_drama_island(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_total_drama_island_during_1_2_at_2051(Res) :- setof((Start,End),globally_total_drama_island_during_1_2(Start,End),AllINtervals), checkvalidity(2051,AllINtervals,Res).

check_query() :- write('Query = globally_total_drama_island_during_1_2_at_2051'), (globally_total_drama_island_during_1_2_at_2051(true) -> write('\nRes   = true');write('\nRes   = false')).

