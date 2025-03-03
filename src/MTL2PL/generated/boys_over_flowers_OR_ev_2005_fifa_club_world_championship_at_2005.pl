:- include('database.pl').
boys_over_flowers(Start,End) :- begin('boys_over_flowers',_,_,Start), end('boys_over_flowers',_,_,End), Start=<End.

ev_2005_fifa_club_world_championship(Start,End) :- begin('ev_2005_fifa_club_world_championship',_,_,Start), end('ev_2005_fifa_club_world_championship',_,_,End), Start=<End.

generate_facts_boys_over_flowers_OR_ev_2005_fifa_club_world_championship([]) :- assert(boys_over_flowers_OR_ev_2005_fifa_club_world_championship(-1,-1)).

generate_facts_boys_over_flowers_OR_ev_2005_fifa_club_world_championship([(Start,End) | Tail]) :- assert(boys_over_flowers_OR_ev_2005_fifa_club_world_championship(Start,End)), generate_facts_boys_over_flowers_OR_ev_2005_fifa_club_world_championship(Tail).

boys_over_flowers_OR_ev_2005_fifa_club_world_championship_aux() :- findall((Start,End),boys_over_flowers(Start,End),Interval1), findall((Start,End),ev_2005_fifa_club_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_boys_over_flowers_OR_ev_2005_fifa_club_world_championship(Interval).

boys_over_flowers_OR_ev_2005_fifa_club_world_championship_at_2005(Res) :- setof((Start,End),boys_over_flowers_OR_ev_2005_fifa_club_world_championship(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = boys_over_flowers_OR_ev_2005_fifa_club_world_championship_at_2005'), (boys_over_flowers_OR_ev_2005_fifa_club_world_championship_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- boys_over_flowers_OR_ev_2005_fifa_club_world_championship_aux().

