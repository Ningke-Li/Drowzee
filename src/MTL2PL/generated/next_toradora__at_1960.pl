:- include('database.pl').
toradora_(Start,End) :- begin('toradora_',_,_,Start), end('toradora_',_,_,End), Start=<End.

next_toradora_(Start,End) :- toradora_(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_toradora__at_1960(Res) :- setof((Start,End),next_toradora_(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = next_toradora__at_1960'), (next_toradora__at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).

