:- include('database.pl').
malayan_emergency(Start,End) :- begin('malayan_emergency',_,_,Start), end('malayan_emergency',_,_,End), Start=<End.

surrealism(Start,End) :- begin('surrealism',_,_,Start), end('surrealism',_,_,End), Start=<End.

generate_facts_malayan_emergency_AND_surrealism([]) :- assert(malayan_emergency_AND_surrealism(-1,-1)).

generate_facts_malayan_emergency_AND_surrealism([(Start,End) | Tail]) :- assert(malayan_emergency_AND_surrealism(Start,End)), generate_facts_malayan_emergency_AND_surrealism(Tail).

malayan_emergency_AND_surrealism_aux() :- findall((Start,End),malayan_emergency(Start,End),Interval1), findall((Start,End),surrealism(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_malayan_emergency_AND_surrealism(Interval).

malayan_emergency_AND_surrealism_at_1959(Res) :- setof((Start,End),malayan_emergency_AND_surrealism(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = malayan_emergency_AND_surrealism_at_1959'), (malayan_emergency_AND_surrealism_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- malayan_emergency_AND_surrealism_aux().

