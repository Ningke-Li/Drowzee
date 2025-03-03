:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

generate_facts_the_fairly_oddparents_AND_ev_2012_13_la_liga([]) :- assert(the_fairly_oddparents_AND_ev_2012_13_la_liga(-1,-1)).

generate_facts_the_fairly_oddparents_AND_ev_2012_13_la_liga([(Start,End) | Tail]) :- assert(the_fairly_oddparents_AND_ev_2012_13_la_liga(Start,End)), generate_facts_the_fairly_oddparents_AND_ev_2012_13_la_liga(Tail).

the_fairly_oddparents_AND_ev_2012_13_la_liga_aux() :- findall((Start,End),the_fairly_oddparents(Start,End),Interval1), findall((Start,End),ev_2012_13_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_fairly_oddparents_AND_ev_2012_13_la_liga(Interval).

the_fairly_oddparents_AND_ev_2012_13_la_liga_at_2061(Res) :- setof((Start,End),the_fairly_oddparents_AND_ev_2012_13_la_liga(Start,End),AllINtervals), checkvalidity(2061,AllINtervals,Res).

check_query() :- write('Query = the_fairly_oddparents_AND_ev_2012_13_la_liga_at_2061'), (the_fairly_oddparents_AND_ev_2012_13_la_liga_at_2061(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_fairly_oddparents_AND_ev_2012_13_la_liga_aux().

