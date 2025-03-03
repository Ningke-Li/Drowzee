:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

globally_gossip_girl_during_3_5(Start,End) :- gossip_girl(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

globally_gossip_girl_during_3_5_at_1993(Res) :- setof((Start,End),globally_gossip_girl_during_3_5(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = globally_gossip_girl_during_3_5_at_1993'), (globally_gossip_girl_during_3_5_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

