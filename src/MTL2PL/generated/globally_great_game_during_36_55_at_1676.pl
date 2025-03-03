:- include('database.pl').
great_game(Start,End) :- begin('great_game',_,_,Start), end('great_game',_,_,End), Start=<End.

globally_great_game_during_36_55(Start,End) :- great_game(Start1,End1), Start is (Start1-36), End is (End1-55), Start=<End.

globally_great_game_during_36_55_at_1676(Res) :- setof((Start,End),globally_great_game_during_36_55(Start,End),AllINtervals), checkvalidity(1676,AllINtervals,Res).

check_query() :- write('Query = globally_great_game_during_36_55_at_1676'), (globally_great_game_during_36_55_at_1676(true) -> write('\nRes   = true');write('\nRes   = false')).

