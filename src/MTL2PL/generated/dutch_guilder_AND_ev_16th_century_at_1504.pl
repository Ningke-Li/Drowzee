:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

ev_16th_century(Start,End) :- begin('ev_16th_century',_,_,Start), end('ev_16th_century',_,_,End), Start=<End.

generate_facts_dutch_guilder_AND_ev_16th_century([]) :- assert(dutch_guilder_AND_ev_16th_century(-1,-1)).

generate_facts_dutch_guilder_AND_ev_16th_century([(Start,End) | Tail]) :- assert(dutch_guilder_AND_ev_16th_century(Start,End)), generate_facts_dutch_guilder_AND_ev_16th_century(Tail).

dutch_guilder_AND_ev_16th_century_aux() :- findall((Start,End),dutch_guilder(Start,End),Interval1), findall((Start,End),ev_16th_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dutch_guilder_AND_ev_16th_century(Interval).

dutch_guilder_AND_ev_16th_century_at_1504(Res) :- setof((Start,End),dutch_guilder_AND_ev_16th_century(Start,End),AllINtervals), checkvalidity(1504,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_AND_ev_16th_century_at_1504'), (dutch_guilder_AND_ev_16th_century_at_1504(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dutch_guilder_AND_ev_16th_century_aux().

