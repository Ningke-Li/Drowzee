:- include('database.pl').
spanish_golden_age(Start,End) :- begin('spanish_golden_age',_,_,Start), end('spanish_golden_age',_,_,End), Start=<End.

scanian_war(Start,End) :- begin('scanian_war',_,_,Start), end('scanian_war',_,_,End), Start=<End.

spanish_golden_age_last_till_101_107(Start,End) :- spanish_golden_age(Start1,End1), (End1-Start1)>=101, Start is (Start1+101), End is (End1+1).

spanish_golden_age_until_scanian_war_during_101_107_overlap(Start,End) :- spanish_golden_age_last_till_101_107(Start1,End1), scanian_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

spanish_golden_age_until_scanian_war_during_101_107(Start,End) :- spanish_golden_age(W1,_), spanish_golden_age_until_scanian_war_during_101_107_overlap(Start1,End1), Start is max((Start1-107),W1), End is (End1-101), Start=<End.

spanish_golden_age_until_scanian_war_during_101_107_at_1461(Res) :- setof((Start,End),spanish_golden_age_until_scanian_war_during_101_107(Start,End),AllINtervals), checkvalidity(1461,AllINtervals,Res).

check_query() :- write('Query = spanish_golden_age_until_scanian_war_during_101_107_at_1461'), (spanish_golden_age_until_scanian_war_during_101_107_at_1461(true) -> write('\nRes   = true');write('\nRes   = false')).

