:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

globally_italian_lira_during_2_141(Start,End) :- italian_lira(Start1,End1), Start is (Start1-2), End is (End1-141), Start=<End.

finally_globally_italian_lira_during_2_141_during_8_20(Start,End) :- globally_italian_lira_during_2_141(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

finally_globally_italian_lira_during_2_141_during_8_20_at_1859(Res) :- setof((Start,End),finally_globally_italian_lira_during_2_141_during_8_20(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = finally_globally_italian_lira_during_2_141_during_8_20_at_1859'), (finally_globally_italian_lira_during_2_141_during_8_20_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

