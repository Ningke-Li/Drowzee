:- include('database.pl').
ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

ultimate_spider_man_last_till_3_5(Start,End) :- ultimate_spider_man(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

ultimate_spider_man_until_this_is_us_during_3_5_overlap(Start,End) :- ultimate_spider_man_last_till_3_5(Start1,End1), this_is_us(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ultimate_spider_man_until_this_is_us_during_3_5(Start,End) :- ultimate_spider_man(W1,_), ultimate_spider_man_until_this_is_us_during_3_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-3), Start=<End.

ultimate_spider_man_until_this_is_us_during_3_5_at_2058(Res) :- setof((Start,End),ultimate_spider_man_until_this_is_us_during_3_5(Start,End),AllINtervals), checkvalidity(2058,AllINtervals,Res).

check_query() :- write('Query = ultimate_spider_man_until_this_is_us_during_3_5_at_2058'), (ultimate_spider_man_until_this_is_us_during_3_5_at_2058(true) -> write('\nRes   = true');write('\nRes   = false')).

