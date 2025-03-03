:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

ev_2008_09_uefa_champions_league(Start,End) :- begin('ev_2008_09_uefa_champions_league',_,_,Start), end('ev_2008_09_uefa_champions_league',_,_,End), Start=<End.

csi__miami_last_till_4_5(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5_overlap(Start,End) :- csi__miami_last_till_4_5(Start1,End1), ev_2008_09_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5(Start,End) :- csi__miami(W1,_), csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-4), Start=<End.

csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5_at_2005(Res) :- setof((Start,End),csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5_at_2005'), (csi__miami_until_ev_2008_09_uefa_champions_league_during_4_5_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

