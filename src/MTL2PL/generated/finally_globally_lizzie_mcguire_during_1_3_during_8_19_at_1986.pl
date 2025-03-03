:- include('database.pl').
lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

globally_lizzie_mcguire_during_1_3(Start,End) :- lizzie_mcguire(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_lizzie_mcguire_during_1_3_during_8_19(Start,End) :- globally_lizzie_mcguire_during_1_3(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

finally_globally_lizzie_mcguire_during_1_3_during_8_19_at_1986(Res) :- setof((Start,End),finally_globally_lizzie_mcguire_during_1_3_during_8_19(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = finally_globally_lizzie_mcguire_during_1_3_during_8_19_at_1986'), (finally_globally_lizzie_mcguire_during_1_3_during_8_19_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

