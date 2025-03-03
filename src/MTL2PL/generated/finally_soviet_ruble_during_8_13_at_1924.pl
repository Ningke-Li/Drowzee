:- include('database.pl').
soviet_ruble(Start,End) :- begin('soviet_ruble',_,_,Start), end('soviet_ruble',_,_,End), Start=<End.

finally_soviet_ruble_during_8_13(Start,End) :- soviet_ruble(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

finally_soviet_ruble_during_8_13_at_1924(Res) :- setof((Start,End),finally_soviet_ruble_during_8_13(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = finally_soviet_ruble_during_8_13_at_1924'), (finally_soviet_ruble_during_8_13_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

