:- include('database.pl').
ev_2004_05_la_liga(Start,End) :- begin('ev_2004_05_la_liga',_,_,Start), end('ev_2004_05_la_liga',_,_,End), Start=<End.

the_l_word(Start,End) :- begin('the_l_word',_,_,Start), end('the_l_word',_,_,End), Start=<End.

generate_facts_ev_2004_05_la_liga_OR_the_l_word([]) :- assert(ev_2004_05_la_liga_OR_the_l_word(-1,-1)).

generate_facts_ev_2004_05_la_liga_OR_the_l_word([(Start,End) | Tail]) :- assert(ev_2004_05_la_liga_OR_the_l_word(Start,End)), generate_facts_ev_2004_05_la_liga_OR_the_l_word(Tail).

ev_2004_05_la_liga_OR_the_l_word_aux() :- findall((Start,End),ev_2004_05_la_liga(Start,End),Interval1), findall((Start,End),the_l_word(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2004_05_la_liga_OR_the_l_word(Interval).

ev_2004_05_la_liga_OR_the_l_word_at_1872(Res) :- setof((Start,End),ev_2004_05_la_liga_OR_the_l_word(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = ev_2004_05_la_liga_OR_the_l_word_at_1872'), (ev_2004_05_la_liga_OR_the_l_word_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_05_la_liga_OR_the_l_word_aux().

