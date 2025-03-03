:- include('database.pl').
american_revolutionary_war(Start,End) :- begin('american_revolutionary_war',_,_,Start), end('american_revolutionary_war',_,_,End), Start=<End.

globally_american_revolutionary_war_during_2_7(Start,End) :- american_revolutionary_war(Start1,End1), Start is (Start1-2), End is (End1-7), Start=<End.

finally_globally_american_revolutionary_war_during_2_7_during_9_13(Start,End) :- globally_american_revolutionary_war_during_2_7(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_globally_american_revolutionary_war_during_2_7_during_9_13_at_1763(Res) :- setof((Start,End),finally_globally_american_revolutionary_war_during_2_7_during_9_13(Start,End),AllINtervals), checkvalidity(1763,AllINtervals,Res).

check_query() :- write('Query = finally_globally_american_revolutionary_war_during_2_7_during_9_13_at_1763'), (finally_globally_american_revolutionary_war_during_2_7_during_9_13_at_1763(true) -> write('\nRes   = true');write('\nRes   = false')).

