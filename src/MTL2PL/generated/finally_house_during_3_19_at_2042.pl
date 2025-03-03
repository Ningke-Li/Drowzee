:- include('database.pl').
house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

finally_house_during_3_19(Start,End) :- house(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

finally_house_during_3_19_at_2042(Res) :- setof((Start,End),finally_house_during_3_19(Start,End),AllINtervals), checkvalidity(2042,AllINtervals,Res).

check_query() :- write('Query = finally_house_during_3_19_at_2042'), (finally_house_during_3_19_at_2042(true) -> write('\nRes   = true');write('\nRes   = false')).

