:- include('database.pl').
two_and_a_half_men(Start,End) :- begin('two_and_a_half_men',_,_,Start), end('two_and_a_half_men',_,_,End), Start=<End.

euromaidan(Start,End) :- begin('euromaidan',_,_,Start), end('euromaidan',_,_,End), Start=<End.

two_and_a_half_men_last_till_8_11(Start,End) :- two_and_a_half_men(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

two_and_a_half_men_until_euromaidan_during_8_11_overlap(Start,End) :- two_and_a_half_men_last_till_8_11(Start1,End1), euromaidan(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

two_and_a_half_men_until_euromaidan_during_8_11(Start,End) :- two_and_a_half_men(W1,_), two_and_a_half_men_until_euromaidan_during_8_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-8), Start=<End.

two_and_a_half_men_until_euromaidan_during_8_11_at_1886(Res) :- setof((Start,End),two_and_a_half_men_until_euromaidan_during_8_11(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = two_and_a_half_men_until_euromaidan_during_8_11_at_1886'), (two_and_a_half_men_until_euromaidan_during_8_11_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).

