:- include('database.pl').
the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

finally_the_newsroom_during_8_18(Start,End) :- the_newsroom(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_the_newsroom_during_8_18_at_1887(Res) :- setof((Start,End),finally_the_newsroom_during_8_18(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = finally_the_newsroom_during_8_18_at_1887'), (finally_the_newsroom_during_8_18_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).

