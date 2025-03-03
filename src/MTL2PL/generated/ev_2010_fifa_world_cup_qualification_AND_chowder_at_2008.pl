:- include('database.pl').
ev_2010_fifa_world_cup_qualification(Start,End) :- begin('ev_2010_fifa_world_cup_qualification',_,_,Start), end('ev_2010_fifa_world_cup_qualification',_,_,End), Start=<End.

chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_qualification_AND_chowder([]) :- assert(ev_2010_fifa_world_cup_qualification_AND_chowder(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_qualification_AND_chowder([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_qualification_AND_chowder(Start,End)), generate_facts_ev_2010_fifa_world_cup_qualification_AND_chowder(Tail).

ev_2010_fifa_world_cup_qualification_AND_chowder_aux() :- findall((Start,End),ev_2010_fifa_world_cup_qualification(Start,End),Interval1), findall((Start,End),chowder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_qualification_AND_chowder(Interval).

ev_2010_fifa_world_cup_qualification_AND_chowder_at_2008(Res) :- setof((Start,End),ev_2010_fifa_world_cup_qualification_AND_chowder(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_qualification_AND_chowder_at_2008'), (ev_2010_fifa_world_cup_qualification_AND_chowder_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_qualification_AND_chowder_aux().

