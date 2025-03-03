:- include('database.pl').
hurricane_ike(Start,End) :- begin('hurricane_ike',_,_,Start), end('hurricane_ike',_,_,End), Start=<End.

ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

generate_facts_hurricane_ike_OR_ghost_whisperer([]) :- assert(hurricane_ike_OR_ghost_whisperer(-1,-1)).

generate_facts_hurricane_ike_OR_ghost_whisperer([(Start,End) | Tail]) :- assert(hurricane_ike_OR_ghost_whisperer(Start,End)), generate_facts_hurricane_ike_OR_ghost_whisperer(Tail).

hurricane_ike_OR_ghost_whisperer_aux() :- findall((Start,End),hurricane_ike(Start,End),Interval1), findall((Start,End),ghost_whisperer(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hurricane_ike_OR_ghost_whisperer(Interval).

hurricane_ike_OR_ghost_whisperer_at_1951(Res) :- setof((Start,End),hurricane_ike_OR_ghost_whisperer(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = hurricane_ike_OR_ghost_whisperer_at_1951'), (hurricane_ike_OR_ghost_whisperer_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hurricane_ike_OR_ghost_whisperer_aux().

