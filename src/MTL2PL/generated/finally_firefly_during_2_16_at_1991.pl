:- include('database.pl').
firefly(Start,End) :- begin('firefly',_,_,Start), end('firefly',_,_,End), Start=<End.

finally_firefly_during_2_16(Start,End) :- firefly(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_firefly_during_2_16_at_1991(Res) :- setof((Start,End),finally_firefly_during_2_16(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = finally_firefly_during_2_16_at_1991'), (finally_firefly_during_2_16_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

