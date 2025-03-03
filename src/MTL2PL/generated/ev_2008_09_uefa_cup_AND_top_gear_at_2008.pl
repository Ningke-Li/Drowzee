:- include('database.pl').
ev_2008_09_uefa_cup(Start,End) :- begin('ev_2008_09_uefa_cup',_,_,Start), end('ev_2008_09_uefa_cup',_,_,End), Start=<End.

top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

generate_facts_ev_2008_09_uefa_cup_AND_top_gear([]) :- assert(ev_2008_09_uefa_cup_AND_top_gear(-1,-1)).

generate_facts_ev_2008_09_uefa_cup_AND_top_gear([(Start,End) | Tail]) :- assert(ev_2008_09_uefa_cup_AND_top_gear(Start,End)), generate_facts_ev_2008_09_uefa_cup_AND_top_gear(Tail).

ev_2008_09_uefa_cup_AND_top_gear_aux() :- findall((Start,End),ev_2008_09_uefa_cup(Start,End),Interval1), findall((Start,End),top_gear(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2008_09_uefa_cup_AND_top_gear(Interval).

ev_2008_09_uefa_cup_AND_top_gear_at_2008(Res) :- setof((Start,End),ev_2008_09_uefa_cup_AND_top_gear(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_2008_09_uefa_cup_AND_top_gear_at_2008'), (ev_2008_09_uefa_cup_AND_top_gear_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_09_uefa_cup_AND_top_gear_aux().

