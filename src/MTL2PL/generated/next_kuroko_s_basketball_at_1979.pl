:- include('database.pl').
kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

next_kuroko_s_basketball(Start,End) :- kuroko_s_basketball(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_kuroko_s_basketball_at_1979(Res) :- setof((Start,End),next_kuroko_s_basketball(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = next_kuroko_s_basketball_at_1979'), (next_kuroko_s_basketball_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

