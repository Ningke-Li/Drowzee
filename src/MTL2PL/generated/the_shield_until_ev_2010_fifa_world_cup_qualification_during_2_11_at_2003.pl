:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

ev_2010_fifa_world_cup_qualification(Start,End) :- begin('ev_2010_fifa_world_cup_qualification',_,_,Start), end('ev_2010_fifa_world_cup_qualification',_,_,End), Start=<End.

the_shield_last_till_2_11(Start,End) :- the_shield(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11_overlap(Start,End) :- the_shield_last_till_2_11(Start1,End1), ev_2010_fifa_world_cup_qualification(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11(Start,End) :- the_shield(W1,_), the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-2), Start=<End.

the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11_at_2003(Res) :- setof((Start,End),the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11_at_2003'), (the_shield_until_ev_2010_fifa_world_cup_qualification_during_2_11_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

