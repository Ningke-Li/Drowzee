:- include('database.pl').
history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

history_of_the_soviet_union_last_till_27_35(Start,End) :- history_of_the_soviet_union(Start1,End1), (End1-Start1)>=27, Start is (Start1+27), End is (End1+1).

history_of_the_soviet_union_until_lenin_peace_prize_during_27_35_overlap(Start,End) :- history_of_the_soviet_union_last_till_27_35(Start1,End1), lenin_peace_prize(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

history_of_the_soviet_union_until_lenin_peace_prize_during_27_35(Start,End) :- history_of_the_soviet_union(W1,_), history_of_the_soviet_union_until_lenin_peace_prize_during_27_35_overlap(Start1,End1), Start is max((Start1-35),W1), End is (End1-27), Start=<End.

history_of_the_soviet_union_until_lenin_peace_prize_during_27_35_at_1926(Res) :- setof((Start,End),history_of_the_soviet_union_until_lenin_peace_prize_during_27_35(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = history_of_the_soviet_union_until_lenin_peace_prize_during_27_35_at_1926'), (history_of_the_soviet_union_until_lenin_peace_prize_during_27_35_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

