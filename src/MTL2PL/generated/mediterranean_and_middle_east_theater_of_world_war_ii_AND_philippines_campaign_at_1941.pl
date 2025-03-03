:- include('database.pl').
mediterranean_and_middle_east_theater_of_world_war_ii(Start,End) :- begin('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,Start), end('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,End), Start=<End.

philippines_campaign(Start,End) :- begin('philippines_campaign',_,_,Start), end('philippines_campaign',_,_,End), Start=<End.

generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign([]) :- assert(mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign(-1,-1)).

generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign([(Start,End) | Tail]) :- assert(mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign(Start,End)), generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign(Tail).

mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign_aux() :- findall((Start,End),mediterranean_and_middle_east_theater_of_world_war_ii(Start,End),Interval1), findall((Start,End),philippines_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign(Interval).

mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign_at_1941(Res) :- setof((Start,End),mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign_at_1941'), (mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mediterranean_and_middle_east_theater_of_world_war_ii_AND_philippines_campaign_aux().

