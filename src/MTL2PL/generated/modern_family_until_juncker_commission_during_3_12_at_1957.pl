:- include('database.pl').
modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

juncker_commission(Start,End) :- begin('juncker_commission',_,_,Start), end('juncker_commission',_,_,End), Start=<End.

modern_family_last_till_3_12(Start,End) :- modern_family(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

modern_family_until_juncker_commission_during_3_12_overlap(Start,End) :- modern_family_last_till_3_12(Start1,End1), juncker_commission(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

modern_family_until_juncker_commission_during_3_12(Start,End) :- modern_family(W1,_), modern_family_until_juncker_commission_during_3_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-3), Start=<End.

modern_family_until_juncker_commission_during_3_12_at_1957(Res) :- setof((Start,End),modern_family_until_juncker_commission_during_3_12(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = modern_family_until_juncker_commission_during_3_12_at_1957'), (modern_family_until_juncker_commission_during_3_12_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).

