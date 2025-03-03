:- include('database.pl').
ev_2011_fifa_club_world_cup(Start,End) :- begin('ev_2011_fifa_club_world_cup',_,_,Start), end('ev_2011_fifa_club_world_cup',_,_,End), Start=<End.

norwegian_campaign(Start,End) :- begin('norwegian_campaign',_,_,Start), end('norwegian_campaign',_,_,End), Start=<End.

generate_facts_ev_2011_fifa_club_world_cup_OR_norwegian_campaign([]) :- assert(ev_2011_fifa_club_world_cup_OR_norwegian_campaign(-1,-1)).

generate_facts_ev_2011_fifa_club_world_cup_OR_norwegian_campaign([(Start,End) | Tail]) :- assert(ev_2011_fifa_club_world_cup_OR_norwegian_campaign(Start,End)), generate_facts_ev_2011_fifa_club_world_cup_OR_norwegian_campaign(Tail).

ev_2011_fifa_club_world_cup_OR_norwegian_campaign_aux() :- findall((Start,End),ev_2011_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),norwegian_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_fifa_club_world_cup_OR_norwegian_campaign(Interval).

ev_2011_fifa_club_world_cup_OR_norwegian_campaign_at_1803(Res) :- setof((Start,End),ev_2011_fifa_club_world_cup_OR_norwegian_campaign(Start,End),AllINtervals), checkvalidity(1803,AllINtervals,Res).

check_query() :- write('Query = ev_2011_fifa_club_world_cup_OR_norwegian_campaign_at_1803'), (ev_2011_fifa_club_world_cup_OR_norwegian_campaign_at_1803(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_fifa_club_world_cup_OR_norwegian_campaign_aux().

