:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

ev_2010_fifa_world_cup_qualification(Start,End) :- begin('ev_2010_fifa_world_cup_qualification',_,_,Start), end('ev_2010_fifa_world_cup_qualification',_,_,End), Start=<End.

scrubs_last_till_1_5(Start,End) :- scrubs(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5_overlap(Start,End) :- scrubs_last_till_1_5(Start1,End1), ev_2010_fifa_world_cup_qualification(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5(Start,End) :- scrubs(W1,_), scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-1), Start=<End.

scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5_at_2005(Res) :- setof((Start,End),scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5_at_2005'), (scrubs_until_ev_2010_fifa_world_cup_qualification_during_1_5_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

