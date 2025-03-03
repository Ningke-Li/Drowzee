:- include('database.pl').
the_tudors(Start,End) :- begin('the_tudors',_,_,Start), end('the_tudors',_,_,End), Start=<End.

finally_the_tudors_during_3_16(Start,End) :- the_tudors(Start1,End1), (Start1-16)=<(End1-3), Start is (Start1-16), End is (End1-3), Start=<End.

finally_the_tudors_during_3_16_at_1943(Res) :- setof((Start,End),finally_the_tudors_during_3_16(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = finally_the_tudors_during_3_16_at_1943'), (finally_the_tudors_during_3_16_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).

