:- include('database.pl').
soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

italian_invasion_of_egypt(Start,End) :- begin('italian_invasion_of_egypt',_,_,Start), end('italian_invasion_of_egypt',_,_,End), Start=<End.

generate_facts_soul_eater_OR_italian_invasion_of_egypt([]) :- assert(soul_eater_OR_italian_invasion_of_egypt(-1,-1)).

generate_facts_soul_eater_OR_italian_invasion_of_egypt([(Start,End) | Tail]) :- assert(soul_eater_OR_italian_invasion_of_egypt(Start,End)), generate_facts_soul_eater_OR_italian_invasion_of_egypt(Tail).

soul_eater_OR_italian_invasion_of_egypt_aux() :- findall((Start,End),soul_eater(Start,End),Interval1), findall((Start,End),italian_invasion_of_egypt(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_soul_eater_OR_italian_invasion_of_egypt(Interval).

soul_eater_OR_italian_invasion_of_egypt_at_2042(Res) :- setof((Start,End),soul_eater_OR_italian_invasion_of_egypt(Start,End),AllINtervals), checkvalidity(2042,AllINtervals,Res).

check_query() :- write('Query = soul_eater_OR_italian_invasion_of_egypt_at_2042'), (soul_eater_OR_italian_invasion_of_egypt_at_2042(true) -> write('\nRes   = true');write('\nRes   = false')).
?- soul_eater_OR_italian_invasion_of_egypt_aux().

