:- include('database.pl').
house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

shake_it_up(Start,End) :- begin('shake_it_up',_,_,Start), end('shake_it_up',_,_,End), Start=<End.

house_last_till_1_8(Start,End) :- house(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

house_until_shake_it_up_during_1_8_overlap(Start,End) :- house_last_till_1_8(Start1,End1), shake_it_up(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

house_until_shake_it_up_during_1_8(Start,End) :- house(W1,_), house_until_shake_it_up_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

house_until_shake_it_up_during_1_8_at_1902(Res) :- setof((Start,End),house_until_shake_it_up_during_1_8(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = house_until_shake_it_up_during_1_8_at_1902'), (house_until_shake_it_up_during_1_8_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

