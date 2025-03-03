:- include('database.pl').
ev_2006_fifa_world_cup_qualification(Start,End) :- begin('ev_2006_fifa_world_cup_qualification',_,_,Start), end('ev_2006_fifa_world_cup_qualification',_,_,End), Start=<End.

entourage(Start,End) :- begin('entourage',_,_,Start), end('entourage',_,_,End), Start=<End.

generate_facts_ev_2006_fifa_world_cup_qualification_AND_entourage([]) :- assert(ev_2006_fifa_world_cup_qualification_AND_entourage(-1,-1)).

generate_facts_ev_2006_fifa_world_cup_qualification_AND_entourage([(Start,End) | Tail]) :- assert(ev_2006_fifa_world_cup_qualification_AND_entourage(Start,End)), generate_facts_ev_2006_fifa_world_cup_qualification_AND_entourage(Tail).

ev_2006_fifa_world_cup_qualification_AND_entourage_aux() :- findall((Start,End),ev_2006_fifa_world_cup_qualification(Start,End),Interval1), findall((Start,End),entourage(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2006_fifa_world_cup_qualification_AND_entourage(Interval).

ev_2006_fifa_world_cup_qualification_AND_entourage_at_1987(Res) :- setof((Start,End),ev_2006_fifa_world_cup_qualification_AND_entourage(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = ev_2006_fifa_world_cup_qualification_AND_entourage_at_1987'), (ev_2006_fifa_world_cup_qualification_AND_entourage_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2006_fifa_world_cup_qualification_AND_entourage_aux().

