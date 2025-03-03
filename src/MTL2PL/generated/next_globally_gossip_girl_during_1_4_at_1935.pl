:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

globally_gossip_girl_during_1_4(Start,End) :- gossip_girl(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

next_globally_gossip_girl_during_1_4(Start,End) :- globally_gossip_girl_during_1_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_gossip_girl_during_1_4_at_1935(Res) :- setof((Start,End),next_globally_gossip_girl_during_1_4(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = next_globally_gossip_girl_during_1_4_at_1935'), (next_globally_gossip_girl_during_1_4_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

