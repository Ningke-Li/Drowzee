:- include('database.pl').
north_sea_flood_of_1953(Start,End) :- begin('north_sea_flood_of_1953',_,_,Start), end('north_sea_flood_of_1953',_,_,End), Start=<End.

finally_north_sea_flood_of_1953_during_2_13(Start,End) :- north_sea_flood_of_1953(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

finally_north_sea_flood_of_1953_during_2_13_at_1951(Res) :- setof((Start,End),finally_north_sea_flood_of_1953_during_2_13(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = finally_north_sea_flood_of_1953_during_2_13_at_1951'), (finally_north_sea_flood_of_1953_during_2_13_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

