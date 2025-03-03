:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

totally_spies__last_till_6_11(Start,End) :- totally_spies_(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

totally_spies__until_ultimate_spider_man_during_6_11_overlap(Start,End) :- totally_spies__last_till_6_11(Start1,End1), ultimate_spider_man(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

totally_spies__until_ultimate_spider_man_during_6_11(Start,End) :- totally_spies_(W1,_), totally_spies__until_ultimate_spider_man_during_6_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-6), Start=<End.

totally_spies__until_ultimate_spider_man_during_6_11_at_2013(Res) :- setof((Start,End),totally_spies__until_ultimate_spider_man_during_6_11(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = totally_spies__until_ultimate_spider_man_during_6_11_at_2013'), (totally_spies__until_ultimate_spider_man_during_6_11_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

