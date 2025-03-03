:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

war_in_afghanistan_last_till_4_13(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13_overlap(Start,End) :- war_in_afghanistan_last_till_4_13(Start1,End1), scooby_doo__mystery_incorporated(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-4), Start=<End.

war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13_at_2002(Res) :- setof((Start,End),war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13_at_2002'), (war_in_afghanistan_until_scooby_doo__mystery_incorporated_during_4_13_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

