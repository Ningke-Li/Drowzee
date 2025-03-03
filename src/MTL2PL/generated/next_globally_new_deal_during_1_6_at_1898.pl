:- include('database.pl').
new_deal(Start,End) :- begin('new_deal',_,_,Start), end('new_deal',_,_,End), Start=<End.

globally_new_deal_during_1_6(Start,End) :- new_deal(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

next_globally_new_deal_during_1_6(Start,End) :- globally_new_deal_during_1_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_new_deal_during_1_6_at_1898(Res) :- setof((Start,End),next_globally_new_deal_during_1_6(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = next_globally_new_deal_during_1_6_at_1898'), (next_globally_new_deal_during_1_6_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).

