:- include('database.pl').
pax_britannica(Start,End) :- begin('pax_britannica',_,_,Start), end('pax_britannica',_,_,End), Start=<End.

philippine_revolution(Start,End) :- begin('philippine_revolution',_,_,Start), end('philippine_revolution',_,_,End), Start=<End.

generate_facts_pax_britannica_AND_philippine_revolution([]) :- assert(pax_britannica_AND_philippine_revolution(-1,-1)).

generate_facts_pax_britannica_AND_philippine_revolution([(Start,End) | Tail]) :- assert(pax_britannica_AND_philippine_revolution(Start,End)), generate_facts_pax_britannica_AND_philippine_revolution(Tail).

pax_britannica_AND_philippine_revolution_aux() :- findall((Start,End),pax_britannica(Start,End),Interval1), findall((Start,End),philippine_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pax_britannica_AND_philippine_revolution(Interval).

pax_britannica_AND_philippine_revolution_at_1906(Res) :- setof((Start,End),pax_britannica_AND_philippine_revolution(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = pax_britannica_AND_philippine_revolution_at_1906'), (pax_britannica_AND_philippine_revolution_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pax_britannica_AND_philippine_revolution_aux().

