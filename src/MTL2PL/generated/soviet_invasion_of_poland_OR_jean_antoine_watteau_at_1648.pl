:- include('database.pl').
soviet_invasion_of_poland(Start,End) :- begin('soviet_invasion_of_poland',_,_,Start), end('soviet_invasion_of_poland',_,_,End), Start=<End.

jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

generate_facts_soviet_invasion_of_poland_OR_jean_antoine_watteau([]) :- assert(soviet_invasion_of_poland_OR_jean_antoine_watteau(-1,-1)).

generate_facts_soviet_invasion_of_poland_OR_jean_antoine_watteau([(Start,End) | Tail]) :- assert(soviet_invasion_of_poland_OR_jean_antoine_watteau(Start,End)), generate_facts_soviet_invasion_of_poland_OR_jean_antoine_watteau(Tail).

soviet_invasion_of_poland_OR_jean_antoine_watteau_aux() :- findall((Start,End),soviet_invasion_of_poland(Start,End),Interval1), findall((Start,End),jean_antoine_watteau(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_soviet_invasion_of_poland_OR_jean_antoine_watteau(Interval).

soviet_invasion_of_poland_OR_jean_antoine_watteau_at_1648(Res) :- setof((Start,End),soviet_invasion_of_poland_OR_jean_antoine_watteau(Start,End),AllINtervals), checkvalidity(1648,AllINtervals,Res).

check_query() :- write('Query = soviet_invasion_of_poland_OR_jean_antoine_watteau_at_1648'), (soviet_invasion_of_poland_OR_jean_antoine_watteau_at_1648(true) -> write('\nRes   = true');write('\nRes   = false')).
?- soviet_invasion_of_poland_OR_jean_antoine_watteau_aux().

