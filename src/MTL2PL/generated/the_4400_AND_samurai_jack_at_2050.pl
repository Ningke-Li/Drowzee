:- include('database.pl').
the_4400(Start,End) :- begin('the_4400',_,_,Start), end('the_4400',_,_,End), Start=<End.

samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

generate_facts_the_4400_AND_samurai_jack([]) :- assert(the_4400_AND_samurai_jack(-1,-1)).

generate_facts_the_4400_AND_samurai_jack([(Start,End) | Tail]) :- assert(the_4400_AND_samurai_jack(Start,End)), generate_facts_the_4400_AND_samurai_jack(Tail).

the_4400_AND_samurai_jack_aux() :- findall((Start,End),the_4400(Start,End),Interval1), findall((Start,End),samurai_jack(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_4400_AND_samurai_jack(Interval).

the_4400_AND_samurai_jack_at_2050(Res) :- setof((Start,End),the_4400_AND_samurai_jack(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = the_4400_AND_samurai_jack_at_2050'), (the_4400_AND_samurai_jack_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_4400_AND_samurai_jack_aux().

