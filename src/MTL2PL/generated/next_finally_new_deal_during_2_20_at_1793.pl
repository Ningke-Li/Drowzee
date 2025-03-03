:- include('database.pl').
new_deal(Start,End) :- begin('new_deal',_,_,Start), end('new_deal',_,_,End), Start=<End.

finally_new_deal_during_2_20(Start,End) :- new_deal(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

next_finally_new_deal_during_2_20(Start,End) :- finally_new_deal_during_2_20(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_new_deal_during_2_20_at_1793(Res) :- setof((Start,End),next_finally_new_deal_during_2_20(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = next_finally_new_deal_during_2_20_at_1793'), (next_finally_new_deal_during_2_20_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).

