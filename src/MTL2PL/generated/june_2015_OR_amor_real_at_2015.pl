:- include('database.pl').
june_2015(Start,End) :- begin('june_2015',_,_,Start), end('june_2015',_,_,End), Start=<End.

amor_real(Start,End) :- begin('amor_real',_,_,Start), end('amor_real',_,_,End), Start=<End.

generate_facts_june_2015_OR_amor_real([]) :- assert(june_2015_OR_amor_real(-1,-1)).

generate_facts_june_2015_OR_amor_real([(Start,End) | Tail]) :- assert(june_2015_OR_amor_real(Start,End)), generate_facts_june_2015_OR_amor_real(Tail).

june_2015_OR_amor_real_aux() :- findall((Start,End),june_2015(Start,End),Interval1), findall((Start,End),amor_real(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_june_2015_OR_amor_real(Interval).

june_2015_OR_amor_real_at_2015(Res) :- setof((Start,End),june_2015_OR_amor_real(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = june_2015_OR_amor_real_at_2015'), (june_2015_OR_amor_real_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- june_2015_OR_amor_real_aux().

