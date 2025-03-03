:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

war_in_afghanistan_last_till_7_13(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

war_in_afghanistan_until_reign_during_7_13_overlap(Start,End) :- war_in_afghanistan_last_till_7_13(Start1,End1), reign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_reign_during_7_13(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_reign_during_7_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-7), Start=<End.

war_in_afghanistan_until_reign_during_7_13_at_2021(Res) :- setof((Start,End),war_in_afghanistan_until_reign_during_7_13(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_reign_during_7_13_at_2021'), (war_in_afghanistan_until_reign_during_7_13_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).

