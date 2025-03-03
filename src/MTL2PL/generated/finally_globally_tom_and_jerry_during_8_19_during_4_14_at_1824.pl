:- include('database.pl').
tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

globally_tom_and_jerry_during_8_19(Start,End) :- tom_and_jerry(Start1,End1), Start is (Start1-8), End is (End1-19), Start=<End.

finally_globally_tom_and_jerry_during_8_19_during_4_14(Start,End) :- globally_tom_and_jerry_during_8_19(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_globally_tom_and_jerry_during_8_19_during_4_14_at_1824(Res) :- setof((Start,End),finally_globally_tom_and_jerry_during_8_19_during_4_14(Start,End),AllINtervals), checkvalidity(1824,AllINtervals,Res).

check_query() :- write('Query = finally_globally_tom_and_jerry_during_8_19_during_4_14_at_1824'), (finally_globally_tom_and_jerry_during_8_19_during_4_14_at_1824(true) -> write('\nRes   = true');write('\nRes   = false')).

