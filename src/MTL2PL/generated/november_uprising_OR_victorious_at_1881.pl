:- include('database.pl').
november_uprising(Start,End) :- begin('november_uprising',_,_,Start), end('november_uprising',_,_,End), Start=<End.

victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

generate_facts_november_uprising_OR_victorious([]) :- assert(november_uprising_OR_victorious(-1,-1)).

generate_facts_november_uprising_OR_victorious([(Start,End) | Tail]) :- assert(november_uprising_OR_victorious(Start,End)), generate_facts_november_uprising_OR_victorious(Tail).

november_uprising_OR_victorious_aux() :- findall((Start,End),november_uprising(Start,End),Interval1), findall((Start,End),victorious(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_november_uprising_OR_victorious(Interval).

november_uprising_OR_victorious_at_1881(Res) :- setof((Start,End),november_uprising_OR_victorious(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = november_uprising_OR_victorious_at_1881'), (november_uprising_OR_victorious_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).
?- november_uprising_OR_victorious_aux().

