:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

veronica_mars_last_till_1_2(Start,End) :- veronica_mars(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

veronica_mars_until_gossip_girl_during_1_2_overlap(Start,End) :- veronica_mars_last_till_1_2(Start1,End1), gossip_girl(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

veronica_mars_until_gossip_girl_during_1_2(Start,End) :- veronica_mars(W1,_), veronica_mars_until_gossip_girl_during_1_2_overlap(Start1,End1), Start is max((Start1-2),W1), End is (End1-1), Start=<End.

veronica_mars_until_gossip_girl_during_1_2_at_1897(Res) :- setof((Start,End),veronica_mars_until_gossip_girl_during_1_2(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = veronica_mars_until_gossip_girl_during_1_2_at_1897'), (veronica_mars_until_gossip_girl_during_1_2_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).

