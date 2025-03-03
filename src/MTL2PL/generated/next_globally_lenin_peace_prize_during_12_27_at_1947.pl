:- include('database.pl').
lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

globally_lenin_peace_prize_during_12_27(Start,End) :- lenin_peace_prize(Start1,End1), Start is (Start1-12), End is (End1-27), Start=<End.

next_globally_lenin_peace_prize_during_12_27(Start,End) :- globally_lenin_peace_prize_during_12_27(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_lenin_peace_prize_during_12_27_at_1947(Res) :- setof((Start,End),next_globally_lenin_peace_prize_during_12_27(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = next_globally_lenin_peace_prize_during_12_27_at_1947'), (next_globally_lenin_peace_prize_during_12_27_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

