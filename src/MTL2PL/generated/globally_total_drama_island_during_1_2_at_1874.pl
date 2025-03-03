:- include('database.pl').
total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

globally_total_drama_island_during_1_2(Start,End) :- total_drama_island(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_total_drama_island_during_1_2_at_1874(Res) :- setof((Start,End),globally_total_drama_island_during_1_2(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = globally_total_drama_island_during_1_2_at_1874'), (globally_total_drama_island_during_1_2_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).

