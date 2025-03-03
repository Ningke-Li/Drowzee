:- include('database.pl').
two_and_a_half_men(Start,End) :- begin('two_and_a_half_men',_,_,Start), end('two_and_a_half_men',_,_,End), Start=<End.

suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

two_and_a_half_men_last_till_4_7(Start,End) :- two_and_a_half_men(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

two_and_a_half_men_until_suits_during_4_7_overlap(Start,End) :- two_and_a_half_men_last_till_4_7(Start1,End1), suits(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

two_and_a_half_men_until_suits_during_4_7(Start,End) :- two_and_a_half_men(W1,_), two_and_a_half_men_until_suits_during_4_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-4), Start=<End.

two_and_a_half_men_until_suits_during_4_7_at_2006(Res) :- setof((Start,End),two_and_a_half_men_until_suits_during_4_7(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = two_and_a_half_men_until_suits_during_4_7_at_2006'), (two_and_a_half_men_until_suits_during_4_7_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

