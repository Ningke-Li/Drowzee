:- include('database.pl').
boston_legal(Start,End) :- begin('boston_legal',_,_,Start), end('boston_legal',_,_,End), Start=<End.

ev_2010_fifa_world_cup_qualification(Start,End) :- begin('ev_2010_fifa_world_cup_qualification',_,_,Start), end('ev_2010_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_boston_legal_AND_ev_2010_fifa_world_cup_qualification([]) :- assert(boston_legal_AND_ev_2010_fifa_world_cup_qualification(-1,-1)).

generate_facts_boston_legal_AND_ev_2010_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(boston_legal_AND_ev_2010_fifa_world_cup_qualification(Start,End)), generate_facts_boston_legal_AND_ev_2010_fifa_world_cup_qualification(Tail).

boston_legal_AND_ev_2010_fifa_world_cup_qualification_aux() :- findall((Start,End),boston_legal(Start,End),Interval1), findall((Start,End),ev_2010_fifa_world_cup_qualification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_boston_legal_AND_ev_2010_fifa_world_cup_qualification(Interval).

boston_legal_AND_ev_2010_fifa_world_cup_qualification_at_2008(Res) :- setof((Start,End),boston_legal_AND_ev_2010_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = boston_legal_AND_ev_2010_fifa_world_cup_qualification_at_2008'), (boston_legal_AND_ev_2010_fifa_world_cup_qualification_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- boston_legal_AND_ev_2010_fifa_world_cup_qualification_aux().

