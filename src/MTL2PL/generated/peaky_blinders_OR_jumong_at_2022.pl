:- include('database.pl').
peaky_blinders(Start,End) :- begin('peaky_blinders',_,_,Start), end('peaky_blinders',_,_,End), Start=<End.

jumong(Start,End) :- begin('jumong',_,_,Start), end('jumong',_,_,End), Start=<End.

generate_facts_peaky_blinders_OR_jumong([]) :- assert(peaky_blinders_OR_jumong(-1,-1)).

generate_facts_peaky_blinders_OR_jumong([(Start,End) | Tail]) :- assert(peaky_blinders_OR_jumong(Start,End)), generate_facts_peaky_blinders_OR_jumong(Tail).

peaky_blinders_OR_jumong_aux() :- findall((Start,End),peaky_blinders(Start,End),Interval1), findall((Start,End),jumong(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_peaky_blinders_OR_jumong(Interval).

peaky_blinders_OR_jumong_at_2022(Res) :- setof((Start,End),peaky_blinders_OR_jumong(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = peaky_blinders_OR_jumong_at_2022'), (peaky_blinders_OR_jumong_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peaky_blinders_OR_jumong_aux().

