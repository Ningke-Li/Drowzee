:- include('database.pl').
belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

boxer_rebellion(Start,End) :- begin('boxer_rebellion',_,_,Start), end('boxer_rebellion',_,_,End), Start=<End.

belle__poque_last_till_4_11(Start,End) :- belle__poque(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

belle__poque_until_boxer_rebellion_during_4_11_overlap(Start,End) :- belle__poque_last_till_4_11(Start1,End1), boxer_rebellion(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

belle__poque_until_boxer_rebellion_during_4_11(Start,End) :- belle__poque(W1,_), belle__poque_until_boxer_rebellion_during_4_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-4), Start=<End.

belle__poque_until_boxer_rebellion_during_4_11_at_1856(Res) :- setof((Start,End),belle__poque_until_boxer_rebellion_during_4_11(Start,End),AllINtervals), checkvalidity(1856,AllINtervals,Res).

check_query() :- write('Query = belle__poque_until_boxer_rebellion_during_4_11_at_1856'), (belle__poque_until_boxer_rebellion_during_4_11_at_1856(true) -> write('\nRes   = true');write('\nRes   = false')).

