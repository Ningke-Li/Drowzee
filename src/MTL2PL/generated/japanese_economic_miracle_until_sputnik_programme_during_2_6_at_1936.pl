:- include('database.pl').
japanese_economic_miracle(Start,End) :- begin('japanese_economic_miracle',_,_,Start), end('japanese_economic_miracle',_,_,End), Start=<End.

sputnik_programme(Start,End) :- begin('sputnik_programme',_,_,Start), end('sputnik_programme',_,_,End), Start=<End.

japanese_economic_miracle_last_till_2_6(Start,End) :- japanese_economic_miracle(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

japanese_economic_miracle_until_sputnik_programme_during_2_6_overlap(Start,End) :- japanese_economic_miracle_last_till_2_6(Start1,End1), sputnik_programme(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

japanese_economic_miracle_until_sputnik_programme_during_2_6(Start,End) :- japanese_economic_miracle(W1,_), japanese_economic_miracle_until_sputnik_programme_during_2_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-2), Start=<End.

japanese_economic_miracle_until_sputnik_programme_during_2_6_at_1936(Res) :- setof((Start,End),japanese_economic_miracle_until_sputnik_programme_during_2_6(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = japanese_economic_miracle_until_sputnik_programme_during_2_6_at_1936'), (japanese_economic_miracle_until_sputnik_programme_during_2_6_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

