:- include('database.pl').
the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

finally_the_originals_during_7_15(Start,End) :- the_originals(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_the_originals_during_7_15_at_2000(Res) :- setof((Start,End),finally_the_originals_during_7_15(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_the_originals_during_7_15_at_2000'), (finally_the_originals_during_7_15_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

