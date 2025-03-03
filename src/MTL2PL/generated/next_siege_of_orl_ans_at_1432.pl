:- include('database.pl').
siege_of_orl_ans(Start,End) :- begin('siege_of_orl_ans',_,_,Start), end('siege_of_orl_ans',_,_,End), Start=<End.

next_siege_of_orl_ans(Start,End) :- siege_of_orl_ans(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_siege_of_orl_ans_at_1432(Res) :- setof((Start,End),next_siege_of_orl_ans(Start,End),AllINtervals), checkvalidity(1432,AllINtervals,Res).

check_query() :- write('Query = next_siege_of_orl_ans_at_1432'), (next_siege_of_orl_ans_at_1432(true) -> write('\nRes   = true');write('\nRes   = false')).

