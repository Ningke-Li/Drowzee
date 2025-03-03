:- include('database.pl').
house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

finally_house_during_2_13(Start,End) :- house(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

finally_house_during_2_13_at_2006(Res) :- setof((Start,End),finally_house_during_2_13(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = finally_house_during_2_13_at_2006'), (finally_house_during_2_13_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

