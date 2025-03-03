:- include('database.pl').
ev__nin_war(Start,End) :- begin('ev__nin_war',_,_,Start), end('ev__nin_war',_,_,End), Start=<End.

finally_ev__nin_war_during_6_18(Start,End) :- ev__nin_war(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_ev__nin_war_during_6_18_at_1392(Res) :- setof((Start,End),finally_ev__nin_war_during_6_18(Start,End),AllINtervals), checkvalidity(1392,AllINtervals,Res).

check_query() :- write('Query = finally_ev__nin_war_during_6_18_at_1392'), (finally_ev__nin_war_during_6_18_at_1392(true) -> write('\nRes   = true');write('\nRes   = false')).

