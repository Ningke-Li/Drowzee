:- include('database.pl').
ev_1906_intercalated_games(Start,End) :- begin('ev_1906_intercalated_games',_,_,Start), end('ev_1906_intercalated_games',_,_,End), Start=<End.

next_ev_1906_intercalated_games(Start,End) :- ev_1906_intercalated_games(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1906_intercalated_games_at_1764(Res) :- setof((Start,End),next_ev_1906_intercalated_games(Start,End),AllINtervals), checkvalidity(1764,AllINtervals,Res).

check_query() :- write('Query = next_ev_1906_intercalated_games_at_1764'), (next_ev_1906_intercalated_games_at_1764(true) -> write('\nRes   = true');write('\nRes   = false')).

