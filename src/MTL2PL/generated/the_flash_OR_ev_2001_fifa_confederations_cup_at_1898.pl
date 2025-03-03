:- include('database.pl').
the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

ev_2001_fifa_confederations_cup(Start,End) :- begin('ev_2001_fifa_confederations_cup',_,_,Start), end('ev_2001_fifa_confederations_cup',_,_,End), Start=<End.

generate_facts_the_flash_OR_ev_2001_fifa_confederations_cup([]) :- assert(the_flash_OR_ev_2001_fifa_confederations_cup(-1,-1)).

generate_facts_the_flash_OR_ev_2001_fifa_confederations_cup([(Start,End) | Tail]) :- assert(the_flash_OR_ev_2001_fifa_confederations_cup(Start,End)), generate_facts_the_flash_OR_ev_2001_fifa_confederations_cup(Tail).

the_flash_OR_ev_2001_fifa_confederations_cup_aux() :- findall((Start,End),the_flash(Start,End),Interval1), findall((Start,End),ev_2001_fifa_confederations_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_flash_OR_ev_2001_fifa_confederations_cup(Interval).

the_flash_OR_ev_2001_fifa_confederations_cup_at_1898(Res) :- setof((Start,End),the_flash_OR_ev_2001_fifa_confederations_cup(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = the_flash_OR_ev_2001_fifa_confederations_cup_at_1898'), (the_flash_OR_ev_2001_fifa_confederations_cup_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_flash_OR_ev_2001_fifa_confederations_cup_aux().

