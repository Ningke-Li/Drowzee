:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

finally_sherlock_during_7_15(Start,End) :- sherlock(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_sherlock_during_7_15_at_1861(Res) :- setof((Start,End),finally_sherlock_during_7_15(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = finally_sherlock_during_7_15_at_1861'), (finally_sherlock_during_7_15_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

