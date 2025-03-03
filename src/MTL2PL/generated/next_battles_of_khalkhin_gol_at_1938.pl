:- include('database.pl').
battles_of_khalkhin_gol(Start,End) :- begin('battles_of_khalkhin_gol',_,_,Start), end('battles_of_khalkhin_gol',_,_,End), Start=<End.

next_battles_of_khalkhin_gol(Start,End) :- battles_of_khalkhin_gol(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battles_of_khalkhin_gol_at_1938(Res) :- setof((Start,End),next_battles_of_khalkhin_gol(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = next_battles_of_khalkhin_gol_at_1938'), (next_battles_of_khalkhin_gol_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

