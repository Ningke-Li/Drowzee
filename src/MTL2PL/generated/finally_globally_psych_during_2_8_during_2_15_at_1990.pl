:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

globally_psych_during_2_8(Start,End) :- psych(Start1,End1), Start is (Start1-2), End is (End1-8), Start=<End.

finally_globally_psych_during_2_8_during_2_15(Start,End) :- globally_psych_during_2_8(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_globally_psych_during_2_8_during_2_15_at_1990(Res) :- setof((Start,End),finally_globally_psych_during_2_8_during_2_15(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = finally_globally_psych_during_2_8_during_2_15_at_1990'), (finally_globally_psych_during_2_8_during_2_15_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).

