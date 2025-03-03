:- include('database.pl').
ev_1850s(Start,End) :- begin('ev_1850s',_,_,Start), end('ev_1850s',_,_,End), Start=<End.

the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

generate_facts_ev_1850s_OR_the_x_factor([]) :- assert(ev_1850s_OR_the_x_factor(-1,-1)).

generate_facts_ev_1850s_OR_the_x_factor([(Start,End) | Tail]) :- assert(ev_1850s_OR_the_x_factor(Start,End)), generate_facts_ev_1850s_OR_the_x_factor(Tail).

ev_1850s_OR_the_x_factor_aux() :- findall((Start,End),ev_1850s(Start,End),Interval1), findall((Start,End),the_x_factor(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1850s_OR_the_x_factor(Interval).

ev_1850s_OR_the_x_factor_at_2005(Res) :- setof((Start,End),ev_1850s_OR_the_x_factor(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = ev_1850s_OR_the_x_factor_at_2005'), (ev_1850s_OR_the_x_factor_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1850s_OR_the_x_factor_aux().

