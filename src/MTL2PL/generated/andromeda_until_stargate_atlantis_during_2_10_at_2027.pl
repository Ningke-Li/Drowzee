:- include('database.pl').
andromeda(Start,End) :- begin('andromeda',_,_,Start), end('andromeda',_,_,End), Start=<End.

stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

andromeda_last_till_2_10(Start,End) :- andromeda(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

andromeda_until_stargate_atlantis_during_2_10_overlap(Start,End) :- andromeda_last_till_2_10(Start1,End1), stargate_atlantis(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

andromeda_until_stargate_atlantis_during_2_10(Start,End) :- andromeda(W1,_), andromeda_until_stargate_atlantis_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

andromeda_until_stargate_atlantis_during_2_10_at_2027(Res) :- setof((Start,End),andromeda_until_stargate_atlantis_during_2_10(Start,End),AllINtervals), checkvalidity(2027,AllINtervals,Res).

check_query() :- write('Query = andromeda_until_stargate_atlantis_during_2_10_at_2027'), (andromeda_until_stargate_atlantis_during_2_10_at_2027(true) -> write('\nRes   = true');write('\nRes   = false')).

