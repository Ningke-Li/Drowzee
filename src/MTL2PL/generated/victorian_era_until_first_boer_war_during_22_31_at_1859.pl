:- include('database.pl').
victorian_era(Start,End) :- begin('victorian_era',_,_,Start), end('victorian_era',_,_,End), Start=<End.

first_boer_war(Start,End) :- begin('first_boer_war',_,_,Start), end('first_boer_war',_,_,End), Start=<End.

victorian_era_last_till_22_31(Start,End) :- victorian_era(Start1,End1), (End1-Start1)>=22, Start is (Start1+22), End is (End1+1).

victorian_era_until_first_boer_war_during_22_31_overlap(Start,End) :- victorian_era_last_till_22_31(Start1,End1), first_boer_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

victorian_era_until_first_boer_war_during_22_31(Start,End) :- victorian_era(W1,_), victorian_era_until_first_boer_war_during_22_31_overlap(Start1,End1), Start is max((Start1-31),W1), End is (End1-22), Start=<End.

victorian_era_until_first_boer_war_during_22_31_at_1859(Res) :- setof((Start,End),victorian_era_until_first_boer_war_during_22_31(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = victorian_era_until_first_boer_war_during_22_31_at_1859'), (victorian_era_until_first_boer_war_during_22_31_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

