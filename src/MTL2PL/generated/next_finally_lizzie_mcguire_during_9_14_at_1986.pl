:- include('database.pl').
lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

finally_lizzie_mcguire_during_9_14(Start,End) :- lizzie_mcguire(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

next_finally_lizzie_mcguire_during_9_14(Start,End) :- finally_lizzie_mcguire_during_9_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_lizzie_mcguire_during_9_14_at_1986(Res) :- setof((Start,End),next_finally_lizzie_mcguire_during_9_14(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = next_finally_lizzie_mcguire_during_9_14_at_1986'), (next_finally_lizzie_mcguire_during_9_14_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

