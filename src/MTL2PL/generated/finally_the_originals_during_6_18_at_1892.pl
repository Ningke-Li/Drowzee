:- include('database.pl').
the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

finally_the_originals_during_6_18(Start,End) :- the_originals(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_the_originals_during_6_18_at_1892(Res) :- setof((Start,End),finally_the_originals_during_6_18(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = finally_the_originals_during_6_18_at_1892'), (finally_the_originals_during_6_18_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

