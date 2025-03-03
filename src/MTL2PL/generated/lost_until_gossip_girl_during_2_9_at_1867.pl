:- include('database.pl').
lost(Start,End) :- begin('lost',_,_,Start), end('lost',_,_,End), Start=<End.

gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

lost_last_till_2_9(Start,End) :- lost(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

lost_until_gossip_girl_during_2_9_overlap(Start,End) :- lost_last_till_2_9(Start1,End1), gossip_girl(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lost_until_gossip_girl_during_2_9(Start,End) :- lost(W1,_), lost_until_gossip_girl_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

lost_until_gossip_girl_during_2_9_at_1867(Res) :- setof((Start,End),lost_until_gossip_girl_during_2_9(Start,End),AllINtervals), checkvalidity(1867,AllINtervals,Res).

check_query() :- write('Query = lost_until_gossip_girl_during_2_9_at_1867'), (lost_until_gossip_girl_during_2_9_at_1867(true) -> write('\nRes   = true');write('\nRes   = false')).

