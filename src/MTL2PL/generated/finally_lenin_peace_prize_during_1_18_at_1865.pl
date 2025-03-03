:- include('database.pl').
lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

finally_lenin_peace_prize_during_1_18(Start,End) :- lenin_peace_prize(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_lenin_peace_prize_during_1_18_at_1865(Res) :- setof((Start,End),finally_lenin_peace_prize_during_1_18(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = finally_lenin_peace_prize_during_1_18_at_1865'), (finally_lenin_peace_prize_during_1_18_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

