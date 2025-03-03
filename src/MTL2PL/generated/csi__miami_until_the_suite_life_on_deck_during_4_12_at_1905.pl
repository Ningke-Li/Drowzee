:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

csi__miami_last_till_4_12(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

csi__miami_until_the_suite_life_on_deck_during_4_12_overlap(Start,End) :- csi__miami_last_till_4_12(Start1,End1), the_suite_life_on_deck(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_the_suite_life_on_deck_during_4_12(Start,End) :- csi__miami(W1,_), csi__miami_until_the_suite_life_on_deck_during_4_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-4), Start=<End.

csi__miami_until_the_suite_life_on_deck_during_4_12_at_1905(Res) :- setof((Start,End),csi__miami_until_the_suite_life_on_deck_during_4_12(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_the_suite_life_on_deck_during_4_12_at_1905'), (csi__miami_until_the_suite_life_on_deck_during_4_12_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

