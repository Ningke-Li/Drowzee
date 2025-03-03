:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

globally_mad_men_during_1_8(Start,End) :- mad_men(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

finally_globally_mad_men_during_1_8_during_3_18(Start,End) :- globally_mad_men_during_1_8(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_globally_mad_men_during_1_8_during_3_18_at_1999(Res) :- setof((Start,End),finally_globally_mad_men_during_1_8_during_3_18(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_globally_mad_men_during_1_8_during_3_18_at_1999'), (finally_globally_mad_men_during_1_8_during_3_18_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

