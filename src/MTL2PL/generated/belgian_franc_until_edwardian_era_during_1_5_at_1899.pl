:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

edwardian_era(Start,End) :- begin('edwardian_era',_,_,Start), end('edwardian_era',_,_,End), Start=<End.

belgian_franc_last_till_1_5(Start,End) :- belgian_franc(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

belgian_franc_until_edwardian_era_during_1_5_overlap(Start,End) :- belgian_franc_last_till_1_5(Start1,End1), edwardian_era(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

belgian_franc_until_edwardian_era_during_1_5(Start,End) :- belgian_franc(W1,_), belgian_franc_until_edwardian_era_during_1_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-1), Start=<End.

belgian_franc_until_edwardian_era_during_1_5_at_1899(Res) :- setof((Start,End),belgian_franc_until_edwardian_era_during_1_5(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_until_edwardian_era_during_1_5_at_1899'), (belgian_franc_until_edwardian_era_during_1_5_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

