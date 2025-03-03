:- include('database.pl').
fullmetal_alchemist(Start,End) :- begin('fullmetal_alchemist',_,_,Start), end('fullmetal_alchemist',_,_,End), Start=<End.

finally_fullmetal_alchemist_during_10_20(Start,End) :- fullmetal_alchemist(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

next_finally_fullmetal_alchemist_during_10_20(Start,End) :- finally_fullmetal_alchemist_during_10_20(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_fullmetal_alchemist_during_10_20_at_1983(Res) :- setof((Start,End),next_finally_fullmetal_alchemist_during_10_20(Start,End),AllINtervals), checkvalidity(1983,AllINtervals,Res).

check_query() :- write('Query = next_finally_fullmetal_alchemist_during_10_20_at_1983'), (next_finally_fullmetal_alchemist_during_10_20_at_1983(true) -> write('\nRes   = true');write('\nRes   = false')).

