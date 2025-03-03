:- include('database.pl').
italian_invasion_of_egypt(Start,End) :- begin('italian_invasion_of_egypt',_,_,Start), end('italian_invasion_of_egypt',_,_,End), Start=<End.

silesian_wars(Start,End) :- begin('silesian_wars',_,_,Start), end('silesian_wars',_,_,End), Start=<End.

generate_facts_italian_invasion_of_egypt_OR_silesian_wars([]) :- assert(italian_invasion_of_egypt_OR_silesian_wars(-1,-1)).

generate_facts_italian_invasion_of_egypt_OR_silesian_wars([(Start,End) | Tail]) :- assert(italian_invasion_of_egypt_OR_silesian_wars(Start,End)), generate_facts_italian_invasion_of_egypt_OR_silesian_wars(Tail).

italian_invasion_of_egypt_OR_silesian_wars_aux() :- findall((Start,End),italian_invasion_of_egypt(Start,End),Interval1), findall((Start,End),silesian_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_italian_invasion_of_egypt_OR_silesian_wars(Interval).

italian_invasion_of_egypt_OR_silesian_wars_at_1805(Res) :- setof((Start,End),italian_invasion_of_egypt_OR_silesian_wars(Start,End),AllINtervals), checkvalidity(1805,AllINtervals,Res).

check_query() :- write('Query = italian_invasion_of_egypt_OR_silesian_wars_at_1805'), (italian_invasion_of_egypt_OR_silesian_wars_at_1805(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_invasion_of_egypt_OR_silesian_wars_aux().

