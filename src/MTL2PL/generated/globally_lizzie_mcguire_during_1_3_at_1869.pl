:- include('database.pl').
lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

globally_lizzie_mcguire_during_1_3(Start,End) :- lizzie_mcguire(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_lizzie_mcguire_during_1_3_at_1869(Res) :- setof((Start,End),globally_lizzie_mcguire_during_1_3(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = globally_lizzie_mcguire_during_1_3_at_1869'), (globally_lizzie_mcguire_during_1_3_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).

