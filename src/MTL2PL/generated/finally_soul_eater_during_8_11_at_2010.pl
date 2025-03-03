:- include('database.pl').
soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

finally_soul_eater_during_8_11(Start,End) :- soul_eater(Start1,End1), (Start1-11)=<(End1-8), Start is (Start1-11), End is (End1-8), Start=<End.

finally_soul_eater_during_8_11_at_2010(Res) :- setof((Start,End),finally_soul_eater_during_8_11(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = finally_soul_eater_during_8_11_at_2010'), (finally_soul_eater_during_8_11_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

