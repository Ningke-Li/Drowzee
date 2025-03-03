:- include('database.pl').
new_deal(Start,End) :- begin('new_deal',_,_,Start), end('new_deal',_,_,End), Start=<End.

ev_2005_fifa_club_world_championship(Start,End) :- begin('ev_2005_fifa_club_world_championship',_,_,Start), end('ev_2005_fifa_club_world_championship',_,_,End), Start=<End.

generate_facts_new_deal_OR_ev_2005_fifa_club_world_championship([]) :- assert(new_deal_OR_ev_2005_fifa_club_world_championship(-1,-1)).

generate_facts_new_deal_OR_ev_2005_fifa_club_world_championship([(Start,End) | Tail]) :- assert(new_deal_OR_ev_2005_fifa_club_world_championship(Start,End)), generate_facts_new_deal_OR_ev_2005_fifa_club_world_championship(Tail).

new_deal_OR_ev_2005_fifa_club_world_championship_aux() :- findall((Start,End),new_deal(Start,End),Interval1), findall((Start,End),ev_2005_fifa_club_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_new_deal_OR_ev_2005_fifa_club_world_championship(Interval).

new_deal_OR_ev_2005_fifa_club_world_championship_at_1935(Res) :- setof((Start,End),new_deal_OR_ev_2005_fifa_club_world_championship(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = new_deal_OR_ev_2005_fifa_club_world_championship_at_1935'), (new_deal_OR_ev_2005_fifa_club_world_championship_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_deal_OR_ev_2005_fifa_club_world_championship_aux().

