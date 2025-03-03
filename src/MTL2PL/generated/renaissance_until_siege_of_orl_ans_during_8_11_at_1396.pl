:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

siege_of_orl_ans(Start,End) :- begin('siege_of_orl_ans',_,_,Start), end('siege_of_orl_ans',_,_,End), Start=<End.

renaissance_last_till_8_11(Start,End) :- renaissance(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

renaissance_until_siege_of_orl_ans_during_8_11_overlap(Start,End) :- renaissance_last_till_8_11(Start1,End1), siege_of_orl_ans(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

renaissance_until_siege_of_orl_ans_during_8_11(Start,End) :- renaissance(W1,_), renaissance_until_siege_of_orl_ans_during_8_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-8), Start=<End.

renaissance_until_siege_of_orl_ans_during_8_11_at_1396(Res) :- setof((Start,End),renaissance_until_siege_of_orl_ans_during_8_11(Start,End),AllINtervals), checkvalidity(1396,AllINtervals,Res).

check_query() :- write('Query = renaissance_until_siege_of_orl_ans_during_8_11_at_1396'), (renaissance_until_siege_of_orl_ans_during_8_11_at_1396(true) -> write('\nRes   = true');write('\nRes   = false')).

