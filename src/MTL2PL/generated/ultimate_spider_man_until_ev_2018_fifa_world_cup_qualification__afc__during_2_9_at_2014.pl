:- include('database.pl').
ultimate_spider_man(Start,End) :- begin('ultimate_spider_man',_,_,Start), end('ultimate_spider_man',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

ultimate_spider_man_last_till_2_9(Start,End) :- ultimate_spider_man(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9_overlap(Start,End) :- ultimate_spider_man_last_till_2_9(Start1,End1), ev_2018_fifa_world_cup_qualification__afc_(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9(Start,End) :- ultimate_spider_man(W1,_), ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9_at_2014(Res) :- setof((Start,End),ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9_at_2014'), (ultimate_spider_man_until_ev_2018_fifa_world_cup_qualification__afc__during_2_9_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

