:- include('database.pl').
game_of_thrones__season_1(Start,End) :- begin('game_of_thrones__season_1',_,_,Start), end('game_of_thrones__season_1',_,_,End), Start=<End.

next_game_of_thrones__season_1(Start,End) :- game_of_thrones__season_1(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_game_of_thrones__season_1_at_2010(Res) :- setof((Start,End),next_game_of_thrones__season_1(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = next_game_of_thrones__season_1_at_2010'), (next_game_of_thrones__season_1_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

