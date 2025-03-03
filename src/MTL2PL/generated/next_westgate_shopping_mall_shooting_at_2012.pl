:- include('database.pl').
westgate_shopping_mall_shooting(Start,End) :- begin('westgate_shopping_mall_shooting',_,_,Start), end('westgate_shopping_mall_shooting',_,_,End), Start=<End.

next_westgate_shopping_mall_shooting(Start,End) :- westgate_shopping_mall_shooting(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_westgate_shopping_mall_shooting_at_2012(Res) :- setof((Start,End),next_westgate_shopping_mall_shooting(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_westgate_shopping_mall_shooting_at_2012'), (next_westgate_shopping_mall_shooting_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

