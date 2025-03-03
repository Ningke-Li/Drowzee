:- include('database.pl').
gravity_falls(Start,End) :- begin('gravity_falls',_,_,Start), end('gravity_falls',_,_,End), Start=<End.

finally_gravity_falls_during_8_14(Start,End) :- gravity_falls(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_gravity_falls_during_8_14_at_1999(Res) :- setof((Start,End),finally_gravity_falls_during_8_14(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_gravity_falls_during_8_14_at_1999'), (finally_gravity_falls_during_8_14_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

