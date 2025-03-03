:- include('database.pl').
queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

a_n_t__farm(Start,End) :- begin('a_n_t__farm',_,_,Start), end('a_n_t__farm',_,_,End), Start=<End.

generate_facts_queer_as_folk_OR_a_n_t__farm([]) :- assert(queer_as_folk_OR_a_n_t__farm(-1,-1)).

generate_facts_queer_as_folk_OR_a_n_t__farm([(Start,End) | Tail]) :- assert(queer_as_folk_OR_a_n_t__farm(Start,End)), generate_facts_queer_as_folk_OR_a_n_t__farm(Tail).

queer_as_folk_OR_a_n_t__farm_aux() :- findall((Start,End),queer_as_folk(Start,End),Interval1), findall((Start,End),a_n_t__farm(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_queer_as_folk_OR_a_n_t__farm(Interval).

queer_as_folk_OR_a_n_t__farm_at_2004(Res) :- setof((Start,End),queer_as_folk_OR_a_n_t__farm(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = queer_as_folk_OR_a_n_t__farm_at_2004'), (queer_as_folk_OR_a_n_t__farm_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- queer_as_folk_OR_a_n_t__farm_aux().

