:- include('database.pl').
north_sea_flood_of_1953(Start,End) :- begin('north_sea_flood_of_1953',_,_,Start), end('north_sea_flood_of_1953',_,_,End), Start=<End.

next_north_sea_flood_of_1953(Start,End) :- north_sea_flood_of_1953(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_north_sea_flood_of_1953_at_1952(Res) :- setof((Start,End),next_north_sea_flood_of_1953(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = next_north_sea_flood_of_1953_at_1952'), (next_north_sea_flood_of_1953_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

