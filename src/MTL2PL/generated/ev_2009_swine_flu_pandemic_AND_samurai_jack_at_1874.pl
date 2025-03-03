:- include('database.pl').
ev_2009_swine_flu_pandemic(Start,End) :- begin('ev_2009_swine_flu_pandemic',_,_,Start), end('ev_2009_swine_flu_pandemic',_,_,End), Start=<End.

samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

generate_facts_ev_2009_swine_flu_pandemic_AND_samurai_jack([]) :- assert(ev_2009_swine_flu_pandemic_AND_samurai_jack(-1,-1)).

generate_facts_ev_2009_swine_flu_pandemic_AND_samurai_jack([(Start,End) | Tail]) :- assert(ev_2009_swine_flu_pandemic_AND_samurai_jack(Start,End)), generate_facts_ev_2009_swine_flu_pandemic_AND_samurai_jack(Tail).

ev_2009_swine_flu_pandemic_AND_samurai_jack_aux() :- findall((Start,End),ev_2009_swine_flu_pandemic(Start,End),Interval1), findall((Start,End),samurai_jack(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2009_swine_flu_pandemic_AND_samurai_jack(Interval).

ev_2009_swine_flu_pandemic_AND_samurai_jack_at_1874(Res) :- setof((Start,End),ev_2009_swine_flu_pandemic_AND_samurai_jack(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = ev_2009_swine_flu_pandemic_AND_samurai_jack_at_1874'), (ev_2009_swine_flu_pandemic_AND_samurai_jack_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_swine_flu_pandemic_AND_samurai_jack_aux().

