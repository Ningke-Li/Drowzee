:- include('database.pl').
modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

the_good_place(Start,End) :- begin('the_good_place',_,_,Start), end('the_good_place',_,_,End), Start=<End.

modern_family_last_till_5_8(Start,End) :- modern_family(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

modern_family_until_the_good_place_during_5_8_overlap(Start,End) :- modern_family_last_till_5_8(Start1,End1), the_good_place(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

modern_family_until_the_good_place_during_5_8(Start,End) :- modern_family(W1,_), modern_family_until_the_good_place_during_5_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-5), Start=<End.

modern_family_until_the_good_place_during_5_8_at_1982(Res) :- setof((Start,End),modern_family_until_the_good_place_during_5_8(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = modern_family_until_the_good_place_during_5_8_at_1982'), (modern_family_until_the_good_place_during_5_8_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).

