:- include('database.pl').
ev_1951_asian_games(Start,End) :- begin('ev_1951_asian_games',_,_,Start), end('ev_1951_asian_games',_,_,End), Start=<End.

next_ev_1951_asian_games(Start,End) :- ev_1951_asian_games(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1951_asian_games_at_1934(Res) :- setof((Start,End),next_ev_1951_asian_games(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = next_ev_1951_asian_games_at_1934'), (next_ev_1951_asian_games_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

