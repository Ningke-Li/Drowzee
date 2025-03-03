:- include('database.pl').
soviet_invasion_of_manchuria(Start,End) :- begin('soviet_invasion_of_manchuria',_,_,Start), end('soviet_invasion_of_manchuria',_,_,End), Start=<End.

lie_to_me(Start,End) :- begin('lie_to_me',_,_,Start), end('lie_to_me',_,_,End), Start=<End.

generate_facts_soviet_invasion_of_manchuria_OR_lie_to_me([]) :- assert(soviet_invasion_of_manchuria_OR_lie_to_me(-1,-1)).

generate_facts_soviet_invasion_of_manchuria_OR_lie_to_me([(Start,End) | Tail]) :- assert(soviet_invasion_of_manchuria_OR_lie_to_me(Start,End)), generate_facts_soviet_invasion_of_manchuria_OR_lie_to_me(Tail).

soviet_invasion_of_manchuria_OR_lie_to_me_aux() :- findall((Start,End),soviet_invasion_of_manchuria(Start,End),Interval1), findall((Start,End),lie_to_me(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_soviet_invasion_of_manchuria_OR_lie_to_me(Interval).

soviet_invasion_of_manchuria_OR_lie_to_me_at_1945(Res) :- setof((Start,End),soviet_invasion_of_manchuria_OR_lie_to_me(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = soviet_invasion_of_manchuria_OR_lie_to_me_at_1945'), (soviet_invasion_of_manchuria_OR_lie_to_me_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- soviet_invasion_of_manchuria_OR_lie_to_me_aux().

