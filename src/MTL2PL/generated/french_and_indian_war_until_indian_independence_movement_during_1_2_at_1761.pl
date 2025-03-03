:- include('database.pl').
french_and_indian_war(Start,End) :- begin('french_and_indian_war',_,_,Start), end('french_and_indian_war',_,_,End), Start=<End.

indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

french_and_indian_war_last_till_1_2(Start,End) :- french_and_indian_war(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

french_and_indian_war_until_indian_independence_movement_during_1_2_overlap(Start,End) :- french_and_indian_war_last_till_1_2(Start1,End1), indian_independence_movement(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

french_and_indian_war_until_indian_independence_movement_during_1_2(Start,End) :- french_and_indian_war(W1,_), french_and_indian_war_until_indian_independence_movement_during_1_2_overlap(Start1,End1), Start is max((Start1-2),W1), End is (End1-1), Start=<End.

french_and_indian_war_until_indian_independence_movement_during_1_2_at_1761(Res) :- setof((Start,End),french_and_indian_war_until_indian_independence_movement_during_1_2(Start,End),AllINtervals), checkvalidity(1761,AllINtervals,Res).

check_query() :- write('Query = french_and_indian_war_until_indian_independence_movement_during_1_2_at_1761'), (french_and_indian_war_until_indian_independence_movement_during_1_2_at_1761(true) -> write('\nRes   = true');write('\nRes   = false')).

