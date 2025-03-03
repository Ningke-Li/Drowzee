:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

ev_1948_arab_israeli_war(Start,End) :- begin('ev_1948_arab_israeli_war',_,_,Start), end('ev_1948_arab_israeli_war',_,_,End), Start=<End.

dutch_guilder_last_till_142_149(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=142, Start is (Start1+142), End is (End1+1).

dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149_overlap(Start,End) :- dutch_guilder_last_till_142_149(Start1,End1), ev_1948_arab_israeli_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149_overlap(Start1,End1), Start is max((Start1-149),W1), End is (End1-142), Start=<End.

dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149_at_1697(Res) :- setof((Start,End),dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149(Start,End),AllINtervals), checkvalidity(1697,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149_at_1697'), (dutch_guilder_until_ev_1948_arab_israeli_war_during_142_149_at_1697(true) -> write('\nRes   = true');write('\nRes   = false')).

