:- include('database.pl').
the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

ev_2008_09_serie_a(Start,End) :- begin('ev_2008_09_serie_a',_,_,Start), end('ev_2008_09_serie_a',_,_,End), Start=<End.

generate_facts_the_penguins_of_madagascar_AND_ev_2008_09_serie_a([]) :- assert(the_penguins_of_madagascar_AND_ev_2008_09_serie_a(-1,-1)).

generate_facts_the_penguins_of_madagascar_AND_ev_2008_09_serie_a([(Start,End) | Tail]) :- assert(the_penguins_of_madagascar_AND_ev_2008_09_serie_a(Start,End)), generate_facts_the_penguins_of_madagascar_AND_ev_2008_09_serie_a(Tail).

the_penguins_of_madagascar_AND_ev_2008_09_serie_a_aux() :- findall((Start,End),the_penguins_of_madagascar(Start,End),Interval1), findall((Start,End),ev_2008_09_serie_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_penguins_of_madagascar_AND_ev_2008_09_serie_a(Interval).

the_penguins_of_madagascar_AND_ev_2008_09_serie_a_at_2055(Res) :- setof((Start,End),the_penguins_of_madagascar_AND_ev_2008_09_serie_a(Start,End),AllINtervals), checkvalidity(2055,AllINtervals,Res).

check_query() :- write('Query = the_penguins_of_madagascar_AND_ev_2008_09_serie_a_at_2055'), (the_penguins_of_madagascar_AND_ev_2008_09_serie_a_at_2055(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_penguins_of_madagascar_AND_ev_2008_09_serie_a_aux().

