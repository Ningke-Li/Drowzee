:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

globally_the_mentalist_during_4_7(Start,End) :- the_mentalist(Start1,End1), Start is (Start1-4), End is (End1-7), Start=<End.

finally_globally_the_mentalist_during_4_7_during_8_18(Start,End) :- globally_the_mentalist_during_4_7(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_globally_the_mentalist_during_4_7_during_8_18_at_1946(Res) :- setof((Start,End),finally_globally_the_mentalist_during_4_7_during_8_18(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = finally_globally_the_mentalist_during_4_7_during_8_18_at_1946'), (finally_globally_the_mentalist_during_4_7_during_8_18_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).

