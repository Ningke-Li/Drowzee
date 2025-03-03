:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

war_in_afghanistan_last_till_1_7(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

war_in_afghanistan_until_stargate_atlantis_during_1_7_overlap(Start,End) :- war_in_afghanistan_last_till_1_7(Start1,End1), stargate_atlantis(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_stargate_atlantis_during_1_7(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_stargate_atlantis_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

war_in_afghanistan_until_stargate_atlantis_during_1_7_at_1994(Res) :- setof((Start,End),war_in_afghanistan_until_stargate_atlantis_during_1_7(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_stargate_atlantis_during_1_7_at_1994'), (war_in_afghanistan_until_stargate_atlantis_during_1_7_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

