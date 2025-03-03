:- include('database.pl').
early_modern_period(Start,End) :- begin('early_modern_period',_,_,Start), end('early_modern_period',_,_,End), Start=<End.

nine_years__war(Start,End) :- begin('nine_years__war',_,_,Start), end('nine_years__war',_,_,End), Start=<End.

early_modern_period_last_till_127_132(Start,End) :- early_modern_period(Start1,End1), (End1-Start1)>=127, Start is (Start1+127), End is (End1+1).

early_modern_period_until_nine_years__war_during_127_132_overlap(Start,End) :- early_modern_period_last_till_127_132(Start1,End1), nine_years__war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

early_modern_period_until_nine_years__war_during_127_132(Start,End) :- early_modern_period(W1,_), early_modern_period_until_nine_years__war_during_127_132_overlap(Start1,End1), Start is max((Start1-132),W1), End is (End1-127), Start=<End.

early_modern_period_until_nine_years__war_during_127_132_at_1599(Res) :- setof((Start,End),early_modern_period_until_nine_years__war_during_127_132(Start,End),AllINtervals), checkvalidity(1599,AllINtervals,Res).

check_query() :- write('Query = early_modern_period_until_nine_years__war_during_127_132_at_1599'), (early_modern_period_until_nine_years__war_during_127_132_at_1599(true) -> write('\nRes   = true');write('\nRes   = false')).

