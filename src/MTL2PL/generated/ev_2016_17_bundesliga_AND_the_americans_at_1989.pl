:- include('database.pl').
ev_2016_17_bundesliga(Start,End) :- begin('ev_2016_17_bundesliga',_,_,Start), end('ev_2016_17_bundesliga',_,_,End), Start=<End.

the_americans(Start,End) :- begin('the_americans',_,_,Start), end('the_americans',_,_,End), Start=<End.

generate_facts_ev_2016_17_bundesliga_AND_the_americans([]) :- assert(ev_2016_17_bundesliga_AND_the_americans(-1,-1)).

generate_facts_ev_2016_17_bundesliga_AND_the_americans([(Start,End) | Tail]) :- assert(ev_2016_17_bundesliga_AND_the_americans(Start,End)), generate_facts_ev_2016_17_bundesliga_AND_the_americans(Tail).

ev_2016_17_bundesliga_AND_the_americans_aux() :- findall((Start,End),ev_2016_17_bundesliga(Start,End),Interval1), findall((Start,End),the_americans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2016_17_bundesliga_AND_the_americans(Interval).

ev_2016_17_bundesliga_AND_the_americans_at_1989(Res) :- setof((Start,End),ev_2016_17_bundesliga_AND_the_americans(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = ev_2016_17_bundesliga_AND_the_americans_at_1989'), (ev_2016_17_bundesliga_AND_the_americans_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2016_17_bundesliga_AND_the_americans_aux().

