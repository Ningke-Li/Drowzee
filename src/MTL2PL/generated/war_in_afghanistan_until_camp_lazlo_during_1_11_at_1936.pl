:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

camp_lazlo(Start,End) :- begin('camp_lazlo',_,_,Start), end('camp_lazlo',_,_,End), Start=<End.

war_in_afghanistan_last_till_1_11(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

war_in_afghanistan_until_camp_lazlo_during_1_11_overlap(Start,End) :- war_in_afghanistan_last_till_1_11(Start1,End1), camp_lazlo(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_camp_lazlo_during_1_11(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_camp_lazlo_during_1_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-1), Start=<End.

war_in_afghanistan_until_camp_lazlo_during_1_11_at_1936(Res) :- setof((Start,End),war_in_afghanistan_until_camp_lazlo_during_1_11(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_camp_lazlo_during_1_11_at_1936'), (war_in_afghanistan_until_camp_lazlo_during_1_11_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

