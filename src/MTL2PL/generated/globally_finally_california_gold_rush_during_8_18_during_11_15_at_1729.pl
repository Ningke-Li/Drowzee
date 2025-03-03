:- include('database.pl').
california_gold_rush(Start,End) :- begin('california_gold_rush',_,_,Start), end('california_gold_rush',_,_,End), Start=<End.

finally_california_gold_rush_during_8_18(Start,End) :- california_gold_rush(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

globally_finally_california_gold_rush_during_8_18_during_11_15(Start,End) :- finally_california_gold_rush_during_8_18(Start1,End1), Start is (Start1-11), End is (End1-15), Start=<End.

globally_finally_california_gold_rush_during_8_18_during_11_15_at_1729(Res) :- setof((Start,End),globally_finally_california_gold_rush_during_8_18_during_11_15(Start,End),AllINtervals), checkvalidity(1729,AllINtervals,Res).

check_query() :- write('Query = globally_finally_california_gold_rush_during_8_18_during_11_15_at_1729'), (globally_finally_california_gold_rush_during_8_18_during_11_15_at_1729(true) -> write('\nRes   = true');write('\nRes   = false')).

