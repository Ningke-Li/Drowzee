:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

ev_2011_12_uefa_champions_league(Start,End) :- begin('ev_2011_12_uefa_champions_league',_,_,Start), end('ev_2011_12_uefa_champions_league',_,_,End), Start=<End.

gossip_girl_last_till_2_4(Start,End) :- gossip_girl(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4_overlap(Start,End) :- gossip_girl_last_till_2_4(Start1,End1), ev_2011_12_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4(Start,End) :- gossip_girl(W1,_), gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4_at_1959(Res) :- setof((Start,End),gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4_at_1959'), (gossip_girl_until_ev_2011_12_uefa_champions_league_during_2_4_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

