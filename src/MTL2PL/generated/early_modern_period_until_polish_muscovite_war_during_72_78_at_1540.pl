:- include('database.pl').
early_modern_period(Start,End) :- begin('early_modern_period',_,_,Start), end('early_modern_period',_,_,End), Start=<End.

polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

early_modern_period_last_till_72_78(Start,End) :- early_modern_period(Start1,End1), (End1-Start1)>=72, Start is (Start1+72), End is (End1+1).

early_modern_period_until_polish_muscovite_war_during_72_78_overlap(Start,End) :- early_modern_period_last_till_72_78(Start1,End1), polish_muscovite_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

early_modern_period_until_polish_muscovite_war_during_72_78(Start,End) :- early_modern_period(W1,_), early_modern_period_until_polish_muscovite_war_during_72_78_overlap(Start1,End1), Start is max((Start1-78),W1), End is (End1-72), Start=<End.

early_modern_period_until_polish_muscovite_war_during_72_78_at_1540(Res) :- setof((Start,End),early_modern_period_until_polish_muscovite_war_during_72_78(Start,End),AllINtervals), checkvalidity(1540,AllINtervals,Res).

check_query() :- write('Query = early_modern_period_until_polish_muscovite_war_during_72_78_at_1540'), (early_modern_period_until_polish_muscovite_war_during_72_78_at_1540(true) -> write('\nRes   = true');write('\nRes   = false')).

