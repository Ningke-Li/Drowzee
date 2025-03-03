:- include('database.pl').
orange_is_the_new_black(Start,End) :- begin('orange_is_the_new_black',_,_,Start), end('orange_is_the_new_black',_,_,End), Start=<End.

fleabag(Start,End) :- begin('fleabag',_,_,Start), end('fleabag',_,_,End), Start=<End.

orange_is_the_new_black_last_till_1_8(Start,End) :- orange_is_the_new_black(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

orange_is_the_new_black_until_fleabag_during_1_8_overlap(Start,End) :- orange_is_the_new_black_last_till_1_8(Start1,End1), fleabag(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orange_is_the_new_black_until_fleabag_during_1_8(Start,End) :- orange_is_the_new_black(W1,_), orange_is_the_new_black_until_fleabag_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

orange_is_the_new_black_until_fleabag_during_1_8_at_2044(Res) :- setof((Start,End),orange_is_the_new_black_until_fleabag_during_1_8(Start,End),AllINtervals), checkvalidity(2044,AllINtervals,Res).

check_query() :- write('Query = orange_is_the_new_black_until_fleabag_during_1_8_at_2044'), (orange_is_the_new_black_until_fleabag_during_1_8_at_2044(true) -> write('\nRes   = true');write('\nRes   = false')).

