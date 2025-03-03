:- include('database.pl').
the_4400(Start,End) :- begin('the_4400',_,_,Start), end('the_4400',_,_,End), Start=<End.

finally_the_4400_during_4_17(Start,End) :- the_4400(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_the_4400_during_4_17_at_1992(Res) :- setof((Start,End),finally_the_4400_during_4_17(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = finally_the_4400_during_4_17_at_1992'), (finally_the_4400_during_4_17_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

