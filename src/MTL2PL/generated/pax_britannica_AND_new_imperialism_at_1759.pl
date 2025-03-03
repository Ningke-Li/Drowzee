:- include('database.pl').
pax_britannica(Start,End) :- begin('pax_britannica',_,_,Start), end('pax_britannica',_,_,End), Start=<End.

new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

generate_facts_pax_britannica_AND_new_imperialism([]) :- assert(pax_britannica_AND_new_imperialism(-1,-1)).

generate_facts_pax_britannica_AND_new_imperialism([(Start,End) | Tail]) :- assert(pax_britannica_AND_new_imperialism(Start,End)), generate_facts_pax_britannica_AND_new_imperialism(Tail).

pax_britannica_AND_new_imperialism_aux() :- findall((Start,End),pax_britannica(Start,End),Interval1), findall((Start,End),new_imperialism(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pax_britannica_AND_new_imperialism(Interval).

pax_britannica_AND_new_imperialism_at_1759(Res) :- setof((Start,End),pax_britannica_AND_new_imperialism(Start,End),AllINtervals), checkvalidity(1759,AllINtervals,Res).

check_query() :- write('Query = pax_britannica_AND_new_imperialism_at_1759'), (pax_britannica_AND_new_imperialism_at_1759(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pax_britannica_AND_new_imperialism_aux().

