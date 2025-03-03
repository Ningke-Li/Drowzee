:- include('database.pl').
new_deal(Start,End) :- begin('new_deal',_,_,Start), end('new_deal',_,_,End), Start=<End.

next_new_deal(Start,End) :- new_deal(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_new_deal_at_1933(Res) :- setof((Start,End),next_new_deal(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = next_new_deal_at_1933'), (next_new_deal_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).

