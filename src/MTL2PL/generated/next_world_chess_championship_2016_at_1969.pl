:- include('database.pl').
world_chess_championship_2016(Start,End) :- begin('world_chess_championship_2016',_,_,Start), end('world_chess_championship_2016',_,_,End), Start=<End.

next_world_chess_championship_2016(Start,End) :- world_chess_championship_2016(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_world_chess_championship_2016_at_1969(Res) :- setof((Start,End),next_world_chess_championship_2016(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = next_world_chess_championship_2016_at_1969'), (next_world_chess_championship_2016_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

