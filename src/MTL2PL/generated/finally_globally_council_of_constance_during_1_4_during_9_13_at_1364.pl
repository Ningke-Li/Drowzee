:- include('database.pl').
council_of_constance(Start,End) :- begin('council_of_constance',_,_,Start), end('council_of_constance',_,_,End), Start=<End.

globally_council_of_constance_during_1_4(Start,End) :- council_of_constance(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_council_of_constance_during_1_4_during_9_13(Start,End) :- globally_council_of_constance_during_1_4(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_globally_council_of_constance_during_1_4_during_9_13_at_1364(Res) :- setof((Start,End),finally_globally_council_of_constance_during_1_4_during_9_13(Start,End),AllINtervals), checkvalidity(1364,AllINtervals,Res).

check_query() :- write('Query = finally_globally_council_of_constance_during_1_4_during_9_13_at_1364'), (finally_globally_council_of_constance_during_1_4_during_9_13_at_1364(true) -> write('\nRes   = true');write('\nRes   = false')).

