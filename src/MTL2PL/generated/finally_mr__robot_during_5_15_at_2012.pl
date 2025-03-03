:- include('database.pl').
mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

finally_mr__robot_during_5_15(Start,End) :- mr__robot(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

finally_mr__robot_during_5_15_at_2012(Res) :- setof((Start,End),finally_mr__robot_during_5_15(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = finally_mr__robot_during_5_15_at_2012'), (finally_mr__robot_during_5_15_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

