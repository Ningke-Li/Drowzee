:- include('database.pl').
scanian_war(Start,End) :- begin('scanian_war',_,_,Start), end('scanian_war',_,_,End), Start=<End.

globally_scanian_war_during_1_4(Start,End) :- scanian_war(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_scanian_war_during_1_4_during_3_15(Start,End) :- globally_scanian_war_during_1_4(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

finally_globally_scanian_war_during_1_4_during_3_15_at_1588(Res) :- setof((Start,End),finally_globally_scanian_war_during_1_4_during_3_15(Start,End),AllINtervals), checkvalidity(1588,AllINtervals,Res).

check_query() :- write('Query = finally_globally_scanian_war_during_1_4_during_3_15_at_1588'), (finally_globally_scanian_war_during_1_4_during_3_15_at_1588(true) -> write('\nRes   = true');write('\nRes   = false')).

