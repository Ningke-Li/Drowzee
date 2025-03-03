:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

gossip_girl_last_till_3_7(Start,End) :- gossip_girl(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

gossip_girl_until_suits_during_3_7_overlap(Start,End) :- gossip_girl_last_till_3_7(Start1,End1), suits(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

gossip_girl_until_suits_during_3_7(Start,End) :- gossip_girl(W1,_), gossip_girl_until_suits_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

gossip_girl_until_suits_during_3_7_at_2009(Res) :- setof((Start,End),gossip_girl_until_suits_during_3_7(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = gossip_girl_until_suits_during_3_7_at_2009'), (gossip_girl_until_suits_during_3_7_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

