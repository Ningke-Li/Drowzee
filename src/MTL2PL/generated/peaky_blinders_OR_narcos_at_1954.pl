:- include('database.pl').
peaky_blinders(Start,End) :- begin('peaky_blinders',_,_,Start), end('peaky_blinders',_,_,End), Start=<End.

narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

generate_facts_peaky_blinders_OR_narcos([]) :- assert(peaky_blinders_OR_narcos(-1,-1)).

generate_facts_peaky_blinders_OR_narcos([(Start,End) | Tail]) :- assert(peaky_blinders_OR_narcos(Start,End)), generate_facts_peaky_blinders_OR_narcos(Tail).

peaky_blinders_OR_narcos_aux() :- findall((Start,End),peaky_blinders(Start,End),Interval1), findall((Start,End),narcos(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_peaky_blinders_OR_narcos(Interval).

peaky_blinders_OR_narcos_at_1954(Res) :- setof((Start,End),peaky_blinders_OR_narcos(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = peaky_blinders_OR_narcos_at_1954'), (peaky_blinders_OR_narcos_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peaky_blinders_OR_narcos_aux().

