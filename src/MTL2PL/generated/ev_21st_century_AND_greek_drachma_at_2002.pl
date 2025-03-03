:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

generate_facts_ev_21st_century_AND_greek_drachma([]) :- assert(ev_21st_century_AND_greek_drachma(-1,-1)).

generate_facts_ev_21st_century_AND_greek_drachma([(Start,End) | Tail]) :- assert(ev_21st_century_AND_greek_drachma(Start,End)), generate_facts_ev_21st_century_AND_greek_drachma(Tail).

ev_21st_century_AND_greek_drachma_aux() :- findall((Start,End),ev_21st_century(Start,End),Interval1), findall((Start,End),greek_drachma(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_21st_century_AND_greek_drachma(Interval).

ev_21st_century_AND_greek_drachma_at_2002(Res) :- setof((Start,End),ev_21st_century_AND_greek_drachma(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = ev_21st_century_AND_greek_drachma_at_2002'), (ev_21st_century_AND_greek_drachma_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_21st_century_AND_greek_drachma_aux().

