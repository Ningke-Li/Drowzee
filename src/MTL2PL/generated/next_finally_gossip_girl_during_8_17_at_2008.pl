:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

finally_gossip_girl_during_8_17(Start,End) :- gossip_girl(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

next_finally_gossip_girl_during_8_17(Start,End) :- finally_gossip_girl_during_8_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_gossip_girl_during_8_17_at_2008(Res) :- setof((Start,End),next_finally_gossip_girl_during_8_17(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_finally_gossip_girl_during_8_17_at_2008'), (next_finally_gossip_girl_during_8_17_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

