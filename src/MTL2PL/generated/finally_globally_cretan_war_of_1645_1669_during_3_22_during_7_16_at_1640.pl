:- include('database.pl').
cretan_war_of_1645_1669(Start,End) :- begin('cretan_war_of_1645_1669',_,_,Start), end('cretan_war_of_1645_1669',_,_,End), Start=<End.

globally_cretan_war_of_1645_1669_during_3_22(Start,End) :- cretan_war_of_1645_1669(Start1,End1), Start is (Start1-3), End is (End1-22), Start=<End.

finally_globally_cretan_war_of_1645_1669_during_3_22_during_7_16(Start,End) :- globally_cretan_war_of_1645_1669_during_3_22(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

finally_globally_cretan_war_of_1645_1669_during_3_22_during_7_16_at_1640(Res) :- setof((Start,End),finally_globally_cretan_war_of_1645_1669_during_3_22_during_7_16(Start,End),AllINtervals), checkvalidity(1640,AllINtervals,Res).

check_query() :- write('Query = finally_globally_cretan_war_of_1645_1669_during_3_22_during_7_16_at_1640'), (finally_globally_cretan_war_of_1645_1669_during_3_22_during_7_16_at_1640(true) -> write('\nRes   = true');write('\nRes   = false')).

