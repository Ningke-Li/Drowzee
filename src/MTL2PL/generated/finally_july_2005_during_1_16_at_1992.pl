:- include('database.pl').
july_2005(Start,End) :- begin('july_2005',_,_,Start), end('july_2005',_,_,End), Start=<End.

finally_july_2005_during_1_16(Start,End) :- july_2005(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_july_2005_during_1_16_at_1992(Res) :- setof((Start,End),finally_july_2005_during_1_16(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = finally_july_2005_during_1_16_at_1992'), (finally_july_2005_during_1_16_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

