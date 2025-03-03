:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

latvian_lats_last_till_1_2(Start,End) :- latvian_lats(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

latvian_lats_until_american_dragon__jake_long_during_1_2_overlap(Start,End) :- latvian_lats_last_till_1_2(Start1,End1), american_dragon__jake_long(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

latvian_lats_until_american_dragon__jake_long_during_1_2(Start,End) :- latvian_lats(W1,_), latvian_lats_until_american_dragon__jake_long_during_1_2_overlap(Start1,End1), Start is max((Start1-2),W1), End is (End1-1), Start=<End.

latvian_lats_until_american_dragon__jake_long_during_1_2_at_1861(Res) :- setof((Start,End),latvian_lats_until_american_dragon__jake_long_during_1_2(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_until_american_dragon__jake_long_during_1_2_at_1861'), (latvian_lats_until_american_dragon__jake_long_during_1_2_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

