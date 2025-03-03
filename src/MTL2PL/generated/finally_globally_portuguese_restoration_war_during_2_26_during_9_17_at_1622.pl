:- include('database.pl').
portuguese_restoration_war(Start,End) :- begin('portuguese_restoration_war',_,_,Start), end('portuguese_restoration_war',_,_,End), Start=<End.

globally_portuguese_restoration_war_during_2_26(Start,End) :- portuguese_restoration_war(Start1,End1), Start is (Start1-2), End is (End1-26), Start=<End.

finally_globally_portuguese_restoration_war_during_2_26_during_9_17(Start,End) :- globally_portuguese_restoration_war_during_2_26(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_globally_portuguese_restoration_war_during_2_26_during_9_17_at_1622(Res) :- setof((Start,End),finally_globally_portuguese_restoration_war_during_2_26_during_9_17(Start,End),AllINtervals), checkvalidity(1622,AllINtervals,Res).

check_query() :- write('Query = finally_globally_portuguese_restoration_war_during_2_26_during_9_17_at_1622'), (finally_globally_portuguese_restoration_war_during_2_26_during_9_17_at_1622(true) -> write('\nRes   = true');write('\nRes   = false')).

