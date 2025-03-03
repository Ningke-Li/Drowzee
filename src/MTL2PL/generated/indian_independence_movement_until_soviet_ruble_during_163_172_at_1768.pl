:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

soviet_ruble(Start,End) :- begin('soviet_ruble',_,_,Start), end('soviet_ruble',_,_,End), Start=<End.

indian_independence_movement_last_till_163_172(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=163, Start is (Start1+163), End is (End1+1).

indian_independence_movement_until_soviet_ruble_during_163_172_overlap(Start,End) :- indian_independence_movement_last_till_163_172(Start1,End1), soviet_ruble(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_soviet_ruble_during_163_172(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_soviet_ruble_during_163_172_overlap(Start1,End1), Start is max((Start1-172),W1), End is (End1-163), Start=<End.

indian_independence_movement_until_soviet_ruble_during_163_172_at_1768(Res) :- setof((Start,End),indian_independence_movement_until_soviet_ruble_during_163_172(Start,End),AllINtervals), checkvalidity(1768,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_soviet_ruble_during_163_172_at_1768'), (indian_independence_movement_until_soviet_ruble_during_163_172_at_1768(true) -> write('\nRes   = true');write('\nRes   = false')).

