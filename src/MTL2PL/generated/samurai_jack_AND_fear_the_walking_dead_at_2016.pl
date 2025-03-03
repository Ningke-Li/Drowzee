:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

generate_facts_samurai_jack_AND_fear_the_walking_dead([]) :- assert(samurai_jack_AND_fear_the_walking_dead(-1,-1)).

generate_facts_samurai_jack_AND_fear_the_walking_dead([(Start,End) | Tail]) :- assert(samurai_jack_AND_fear_the_walking_dead(Start,End)), generate_facts_samurai_jack_AND_fear_the_walking_dead(Tail).

samurai_jack_AND_fear_the_walking_dead_aux() :- findall((Start,End),samurai_jack(Start,End),Interval1), findall((Start,End),fear_the_walking_dead(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_samurai_jack_AND_fear_the_walking_dead(Interval).

samurai_jack_AND_fear_the_walking_dead_at_2016(Res) :- setof((Start,End),samurai_jack_AND_fear_the_walking_dead(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_AND_fear_the_walking_dead_at_2016'), (samurai_jack_AND_fear_the_walking_dead_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- samurai_jack_AND_fear_the_walking_dead_aux().

