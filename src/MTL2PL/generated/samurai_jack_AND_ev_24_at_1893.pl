:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

generate_facts_samurai_jack_AND_ev_24([]) :- assert(samurai_jack_AND_ev_24(-1,-1)).

generate_facts_samurai_jack_AND_ev_24([(Start,End) | Tail]) :- assert(samurai_jack_AND_ev_24(Start,End)), generate_facts_samurai_jack_AND_ev_24(Tail).

samurai_jack_AND_ev_24_aux() :- findall((Start,End),samurai_jack(Start,End),Interval1), findall((Start,End),ev_24(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_samurai_jack_AND_ev_24(Interval).

samurai_jack_AND_ev_24_at_1893(Res) :- setof((Start,End),samurai_jack_AND_ev_24(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_AND_ev_24_at_1893'), (samurai_jack_AND_ev_24_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).
?- samurai_jack_AND_ev_24_aux().

