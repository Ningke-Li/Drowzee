:- include('database.pl').
lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

finally_lenin_peace_prize_during_7_19(Start,End) :- lenin_peace_prize(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

globally_finally_lenin_peace_prize_during_7_19_during_23_39(Start,End) :- finally_lenin_peace_prize_during_7_19(Start1,End1), Start is (Start1-23), End is (End1-39), Start=<End.

globally_finally_lenin_peace_prize_during_7_19_during_23_39_at_1927(Res) :- setof((Start,End),globally_finally_lenin_peace_prize_during_7_19_during_23_39(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = globally_finally_lenin_peace_prize_during_7_19_during_23_39_at_1927'), (globally_finally_lenin_peace_prize_during_7_19_during_23_39_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

