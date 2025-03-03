:- include('database.pl').
ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

globally_ultimate_spider_man_during_2_5(Start,End) :- ultimate_spider_man(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

finally_globally_ultimate_spider_man_during_2_5_during_7_13(Start,End) :- globally_ultimate_spider_man_during_2_5(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

finally_globally_ultimate_spider_man_during_2_5_during_7_13_at_2014(Res) :- setof((Start,End),finally_globally_ultimate_spider_man_during_2_5_during_7_13(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ultimate_spider_man_during_2_5_during_7_13_at_2014'), (finally_globally_ultimate_spider_man_during_2_5_during_7_13_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

