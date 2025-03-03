:- include('database.pl').
peninsular_war(Start,End) :- begin('peninsular_war',_,_,Start), end('peninsular_war',_,_,End), Start=<End.

globally_peninsular_war_during_2_4(Start,End) :- peninsular_war(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

finally_globally_peninsular_war_during_2_4_during_8_14(Start,End) :- globally_peninsular_war_during_2_4(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_globally_peninsular_war_during_2_4_during_8_14_at_1726(Res) :- setof((Start,End),finally_globally_peninsular_war_during_2_4_during_8_14(Start,End),AllINtervals), checkvalidity(1726,AllINtervals,Res).

check_query() :- write('Query = finally_globally_peninsular_war_during_2_4_during_8_14_at_1726'), (finally_globally_peninsular_war_during_2_4_during_8_14_at_1726(true) -> write('\nRes   = true');write('\nRes   = false')).

