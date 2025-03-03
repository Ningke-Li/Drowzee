:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

war_in_afghanistan_last_till_4_8(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8_overlap(Start,End) :- war_in_afghanistan_last_till_4_8(Start1,End1), ev_2010_11_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-4), Start=<End.

war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8_at_1918(Res) :- setof((Start,End),war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8_at_1918'), (war_in_afghanistan_until_ev_2010_11_uefa_champions_league_during_4_8_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

