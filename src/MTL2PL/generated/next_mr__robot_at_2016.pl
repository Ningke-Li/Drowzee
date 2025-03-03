:- include('database.pl').
mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

next_mr__robot(Start,End) :- mr__robot(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_mr__robot_at_2016(Res) :- setof((Start,End),next_mr__robot(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = next_mr__robot_at_2016'), (next_mr__robot_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

