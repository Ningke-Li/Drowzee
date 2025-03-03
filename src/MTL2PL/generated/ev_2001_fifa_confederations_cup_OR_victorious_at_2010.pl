:- include('database.pl').
ev_2001_fifa_confederations_cup(Start,End) :- begin('ev_2001_fifa_confederations_cup',_,_,Start), end('ev_2001_fifa_confederations_cup',_,_,End), Start=<End.

victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

generate_facts_ev_2001_fifa_confederations_cup_OR_victorious([]) :- assert(ev_2001_fifa_confederations_cup_OR_victorious(-1,-1)).

generate_facts_ev_2001_fifa_confederations_cup_OR_victorious([(Start,End) | Tail]) :- assert(ev_2001_fifa_confederations_cup_OR_victorious(Start,End)), generate_facts_ev_2001_fifa_confederations_cup_OR_victorious(Tail).

ev_2001_fifa_confederations_cup_OR_victorious_aux() :- findall((Start,End),ev_2001_fifa_confederations_cup(Start,End),Interval1), findall((Start,End),victorious(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2001_fifa_confederations_cup_OR_victorious(Interval).

ev_2001_fifa_confederations_cup_OR_victorious_at_2010(Res) :- setof((Start,End),ev_2001_fifa_confederations_cup_OR_victorious(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = ev_2001_fifa_confederations_cup_OR_victorious_at_2010'), (ev_2001_fifa_confederations_cup_OR_victorious_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2001_fifa_confederations_cup_OR_victorious_aux().

