:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

ev_2005_06_la_liga(Start,End) :- begin('ev_2005_06_la_liga',_,_,Start), end('ev_2005_06_la_liga',_,_,End), Start=<End.

generate_facts_scrubs_AND_ev_2005_06_la_liga([]) :- assert(scrubs_AND_ev_2005_06_la_liga(-1,-1)).

generate_facts_scrubs_AND_ev_2005_06_la_liga([(Start,End) | Tail]) :- assert(scrubs_AND_ev_2005_06_la_liga(Start,End)), generate_facts_scrubs_AND_ev_2005_06_la_liga(Tail).

scrubs_AND_ev_2005_06_la_liga_aux() :- findall((Start,End),scrubs(Start,End),Interval1), findall((Start,End),ev_2005_06_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scrubs_AND_ev_2005_06_la_liga(Interval).

scrubs_AND_ev_2005_06_la_liga_at_1874(Res) :- setof((Start,End),scrubs_AND_ev_2005_06_la_liga(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = scrubs_AND_ev_2005_06_la_liga_at_1874'), (scrubs_AND_ev_2005_06_la_liga_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scrubs_AND_ev_2005_06_la_liga_aux().

