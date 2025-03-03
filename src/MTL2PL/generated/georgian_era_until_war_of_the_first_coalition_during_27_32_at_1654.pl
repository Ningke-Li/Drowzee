:- include('database.pl').
georgian_era(Start,End) :- begin('georgian_era',_,_,Start), end('georgian_era',_,_,End), Start=<End.

war_of_the_first_coalition(Start,End) :- begin('war_of_the_first_coalition',_,_,Start), end('war_of_the_first_coalition',_,_,End), Start=<End.

georgian_era_last_till_27_32(Start,End) :- georgian_era(Start1,End1), (End1-Start1)>=27, Start is (Start1+27), End is (End1+1).

georgian_era_until_war_of_the_first_coalition_during_27_32_overlap(Start,End) :- georgian_era_last_till_27_32(Start1,End1), war_of_the_first_coalition(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

georgian_era_until_war_of_the_first_coalition_during_27_32(Start,End) :- georgian_era(W1,_), georgian_era_until_war_of_the_first_coalition_during_27_32_overlap(Start1,End1), Start is max((Start1-32),W1), End is (End1-27), Start=<End.

georgian_era_until_war_of_the_first_coalition_during_27_32_at_1654(Res) :- setof((Start,End),georgian_era_until_war_of_the_first_coalition_during_27_32(Start,End),AllINtervals), checkvalidity(1654,AllINtervals,Res).

check_query() :- write('Query = georgian_era_until_war_of_the_first_coalition_during_27_32_at_1654'), (georgian_era_until_war_of_the_first_coalition_during_27_32_at_1654(true) -> write('\nRes   = true');write('\nRes   = false')).

