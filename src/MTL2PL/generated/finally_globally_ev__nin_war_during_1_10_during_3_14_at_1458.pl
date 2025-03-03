:- include('database.pl').
ev__nin_war(Start,End) :- begin('ev__nin_war',_,_,Start), end('ev__nin_war',_,_,End), Start=<End.

globally_ev__nin_war_during_1_10(Start,End) :- ev__nin_war(Start1,End1), Start is (Start1-1), End is (End1-10), Start=<End.

finally_globally_ev__nin_war_during_1_10_during_3_14(Start,End) :- globally_ev__nin_war_during_1_10(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_globally_ev__nin_war_during_1_10_during_3_14_at_1458(Res) :- setof((Start,End),finally_globally_ev__nin_war_during_1_10_during_3_14(Start,End),AllINtervals), checkvalidity(1458,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ev__nin_war_during_1_10_during_3_14_at_1458'), (finally_globally_ev__nin_war_during_1_10_during_3_14_at_1458(true) -> write('\nRes   = true');write('\nRes   = false')).

