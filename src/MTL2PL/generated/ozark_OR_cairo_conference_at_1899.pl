:- include('database.pl').
ozark(Start,End) :- begin('ozark',_,_,Start), end('ozark',_,_,End), Start=<End.

cairo_conference(Start,End) :- begin('cairo_conference',_,_,Start), end('cairo_conference',_,_,End), Start=<End.

generate_facts_ozark_OR_cairo_conference([]) :- assert(ozark_OR_cairo_conference(-1,-1)).

generate_facts_ozark_OR_cairo_conference([(Start,End) | Tail]) :- assert(ozark_OR_cairo_conference(Start,End)), generate_facts_ozark_OR_cairo_conference(Tail).

ozark_OR_cairo_conference_aux() :- findall((Start,End),ozark(Start,End),Interval1), findall((Start,End),cairo_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ozark_OR_cairo_conference(Interval).

ozark_OR_cairo_conference_at_1899(Res) :- setof((Start,End),ozark_OR_cairo_conference(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = ozark_OR_cairo_conference_at_1899'), (ozark_OR_cairo_conference_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ozark_OR_cairo_conference_aux().

