:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

ev_1948_palestine_war(Start,End) :- begin('ev_1948_palestine_war',_,_,Start), end('ev_1948_palestine_war',_,_,End), Start=<End.

orient_express_last_till_25_30(Start,End) :- orient_express(Start1,End1), (End1-Start1)>=25, Start is (Start1+25), End is (End1+1).

orient_express_until_ev_1948_palestine_war_during_25_30_overlap(Start,End) :- orient_express_last_till_25_30(Start1,End1), ev_1948_palestine_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orient_express_until_ev_1948_palestine_war_during_25_30(Start,End) :- orient_express(W1,_), orient_express_until_ev_1948_palestine_war_during_25_30_overlap(Start1,End1), Start is max((Start1-30),W1), End is (End1-25), Start=<End.

orient_express_until_ev_1948_palestine_war_during_25_30_at_1773(Res) :- setof((Start,End),orient_express_until_ev_1948_palestine_war_during_25_30(Start,End),AllINtervals), checkvalidity(1773,AllINtervals,Res).

check_query() :- write('Query = orient_express_until_ev_1948_palestine_war_during_25_30_at_1773'), (orient_express_until_ev_1948_palestine_war_during_25_30_at_1773(true) -> write('\nRes   = true');write('\nRes   = false')).

