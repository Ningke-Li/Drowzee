:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

ev_24_last_till_2_8(Start,End) :- ev_24(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_24_until_stargate_atlantis_during_2_8_overlap(Start,End) :- ev_24_last_till_2_8(Start1,End1), stargate_atlantis(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_24_until_stargate_atlantis_during_2_8(Start,End) :- ev_24(W1,_), ev_24_until_stargate_atlantis_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

ev_24_until_stargate_atlantis_during_2_8_at_2047(Res) :- setof((Start,End),ev_24_until_stargate_atlantis_during_2_8(Start,End),AllINtervals), checkvalidity(2047,AllINtervals,Res).

check_query() :- write('Query = ev_24_until_stargate_atlantis_during_2_8_at_2047'), (ev_24_until_stargate_atlantis_during_2_8_at_2047(true) -> write('\nRes   = true');write('\nRes   = false')).

