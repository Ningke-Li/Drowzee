:- include('database.pl').
ev_2016_summer_paralympics(Start,End) :- begin('ev_2016_summer_paralympics',_,_,Start), end('ev_2016_summer_paralympics',_,_,End), Start=<End.

the_l_word(Start,End) :- begin('the_l_word',_,_,Start), end('the_l_word',_,_,End), Start=<End.

generate_facts_ev_2016_summer_paralympics_OR_the_l_word([]) :- assert(ev_2016_summer_paralympics_OR_the_l_word(-1,-1)).

generate_facts_ev_2016_summer_paralympics_OR_the_l_word([(Start,End) | Tail]) :- assert(ev_2016_summer_paralympics_OR_the_l_word(Start,End)), generate_facts_ev_2016_summer_paralympics_OR_the_l_word(Tail).

ev_2016_summer_paralympics_OR_the_l_word_aux() :- findall((Start,End),ev_2016_summer_paralympics(Start,End),Interval1), findall((Start,End),the_l_word(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2016_summer_paralympics_OR_the_l_word(Interval).

ev_2016_summer_paralympics_OR_the_l_word_at_2016(Res) :- setof((Start,End),ev_2016_summer_paralympics_OR_the_l_word(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = ev_2016_summer_paralympics_OR_the_l_word_at_2016'), (ev_2016_summer_paralympics_OR_the_l_word_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2016_summer_paralympics_OR_the_l_word_aux().

