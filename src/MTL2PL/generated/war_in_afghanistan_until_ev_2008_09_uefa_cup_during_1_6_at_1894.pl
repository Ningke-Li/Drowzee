:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

ev_2008_09_uefa_cup(Start,End) :- begin('ev_2008_09_uefa_cup',_,_,Start), end('ev_2008_09_uefa_cup',_,_,End), Start=<End.

war_in_afghanistan_last_till_1_6(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6_overlap(Start,End) :- war_in_afghanistan_last_till_1_6(Start1,End1), ev_2008_09_uefa_cup(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6_at_1894(Res) :- setof((Start,End),war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6_at_1894'), (war_in_afghanistan_until_ev_2008_09_uefa_cup_during_1_6_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).

