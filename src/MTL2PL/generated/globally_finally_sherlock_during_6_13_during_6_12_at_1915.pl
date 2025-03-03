:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

finally_sherlock_during_6_13(Start,End) :- sherlock(Start1,End1), (Start1-13)=<(End1-6), Start is (Start1-13), End is (End1-6), Start=<End.

globally_finally_sherlock_during_6_13_during_6_12(Start,End) :- finally_sherlock_during_6_13(Start1,End1), Start is (Start1-6), End is (End1-12), Start=<End.

globally_finally_sherlock_during_6_13_during_6_12_at_1915(Res) :- setof((Start,End),globally_finally_sherlock_during_6_13_during_6_12(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = globally_finally_sherlock_during_6_13_during_6_12_at_1915'), (globally_finally_sherlock_during_6_13_during_6_12_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

