:- include('database.pl').
ev_2006_lebanon_war(Start,End) :- begin('ev_2006_lebanon_war',_,_,Start), end('ev_2006_lebanon_war',_,_,End), Start=<End.

finally_ev_2006_lebanon_war_during_1_14(Start,End) :- ev_2006_lebanon_war(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_ev_2006_lebanon_war_during_1_14_at_2000(Res) :- setof((Start,End),finally_ev_2006_lebanon_war_during_1_14(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_lebanon_war_during_1_14_at_2000'), (finally_ev_2006_lebanon_war_during_1_14_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

