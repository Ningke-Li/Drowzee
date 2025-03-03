:- include('database.pl').
arts_and_crafts_movement(Start,End) :- begin('arts_and_crafts_movement',_,_,Start), end('arts_and_crafts_movement',_,_,End), Start=<End.

next_arts_and_crafts_movement(Start,End) :- arts_and_crafts_movement(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_arts_and_crafts_movement_at_1893(Res) :- setof((Start,End),next_arts_and_crafts_movement(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_arts_and_crafts_movement_at_1893'), (next_arts_and_crafts_movement_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

