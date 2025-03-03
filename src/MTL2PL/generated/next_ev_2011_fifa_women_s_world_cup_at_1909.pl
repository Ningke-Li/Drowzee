:- include('database.pl').
ev_2011_fifa_women_s_world_cup(Start,End) :- begin('ev_2011_fifa_women_s_world_cup',_,_,Start), end('ev_2011_fifa_women_s_world_cup',_,_,End), Start=<End.

next_ev_2011_fifa_women_s_world_cup(Start,End) :- ev_2011_fifa_women_s_world_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2011_fifa_women_s_world_cup_at_1909(Res) :- setof((Start,End),next_ev_2011_fifa_women_s_world_cup(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = next_ev_2011_fifa_women_s_world_cup_at_1909'), (next_ev_2011_fifa_women_s_world_cup_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

