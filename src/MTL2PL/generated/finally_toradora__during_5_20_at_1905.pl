:- include('database.pl').
toradora_(Start,End) :- begin('toradora_',_,_,Start), end('toradora_',_,_,End), Start=<End.

finally_toradora__during_5_20(Start,End) :- toradora_(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_toradora__during_5_20_at_1905(Res) :- setof((Start,End),finally_toradora__during_5_20(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = finally_toradora__during_5_20_at_1905'), (finally_toradora__during_5_20_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

