:- include('database.pl').
the_wire(Start,End) :- begin('the_wire',_,_,Start), end('the_wire',_,_,End), Start=<End.

desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

generate_facts_the_wire_AND_desperate_housewives([]) :- assert(the_wire_AND_desperate_housewives(-1,-1)).

generate_facts_the_wire_AND_desperate_housewives([(Start,End) | Tail]) :- assert(the_wire_AND_desperate_housewives(Start,End)), generate_facts_the_wire_AND_desperate_housewives(Tail).

the_wire_AND_desperate_housewives_aux() :- findall((Start,End),the_wire(Start,End),Interval1), findall((Start,End),desperate_housewives(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_wire_AND_desperate_housewives(Interval).

the_wire_AND_desperate_housewives_at_2031(Res) :- setof((Start,End),the_wire_AND_desperate_housewives(Start,End),AllINtervals), checkvalidity(2031,AllINtervals,Res).

check_query() :- write('Query = the_wire_AND_desperate_housewives_at_2031'), (the_wire_AND_desperate_housewives_at_2031(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_wire_AND_desperate_housewives_aux().

