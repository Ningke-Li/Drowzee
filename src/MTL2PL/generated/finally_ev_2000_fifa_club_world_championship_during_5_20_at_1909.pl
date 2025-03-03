:- include('database.pl').
ev_2000_fifa_club_world_championship(Start,End) :- begin('ev_2000_fifa_club_world_championship',_,_,Start), end('ev_2000_fifa_club_world_championship',_,_,End), Start=<End.

finally_ev_2000_fifa_club_world_championship_during_5_20(Start,End) :- ev_2000_fifa_club_world_championship(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_ev_2000_fifa_club_world_championship_during_5_20_at_1909(Res) :- setof((Start,End),finally_ev_2000_fifa_club_world_championship_during_5_20(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2000_fifa_club_world_championship_during_5_20_at_1909'), (finally_ev_2000_fifa_club_world_championship_during_5_20_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

