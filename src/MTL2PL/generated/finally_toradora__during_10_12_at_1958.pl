:- include('database.pl').
toradora_(Start,End) :- begin('toradora_',_,_,Start), end('toradora_',_,_,End), Start=<End.

finally_toradora__during_10_12(Start,End) :- toradora_(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_toradora__during_10_12_at_1958(Res) :- setof((Start,End),finally_toradora__during_10_12(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = finally_toradora__during_10_12_at_1958'), (finally_toradora__during_10_12_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).

