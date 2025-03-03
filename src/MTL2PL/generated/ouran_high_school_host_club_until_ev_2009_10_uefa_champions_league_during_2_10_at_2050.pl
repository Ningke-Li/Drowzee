:- include('database.pl').
ouran_high_school_host_club(Start,End) :- begin('ouran_high_school_host_club',_,_,Start), end('ouran_high_school_host_club',_,_,End), Start=<End.

ev_2009_10_uefa_champions_league(Start,End) :- begin('ev_2009_10_uefa_champions_league',_,_,Start), end('ev_2009_10_uefa_champions_league',_,_,End), Start=<End.

ouran_high_school_host_club_last_till_2_10(Start,End) :- ouran_high_school_host_club(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10_overlap(Start,End) :- ouran_high_school_host_club_last_till_2_10(Start1,End1), ev_2009_10_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10(Start,End) :- ouran_high_school_host_club(W1,_), ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10_at_2050(Res) :- setof((Start,End),ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10_at_2050'), (ouran_high_school_host_club_until_ev_2009_10_uefa_champions_league_during_2_10_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).

