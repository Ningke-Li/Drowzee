:- include('database.pl').
samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

generate_facts_samurai_jack_AND_teen_titans([]) :- assert(samurai_jack_AND_teen_titans(-1,-1)).

generate_facts_samurai_jack_AND_teen_titans([(Start,End) | Tail]) :- assert(samurai_jack_AND_teen_titans(Start,End)), generate_facts_samurai_jack_AND_teen_titans(Tail).

samurai_jack_AND_teen_titans_aux() :- findall((Start,End),samurai_jack(Start,End),Interval1), findall((Start,End),teen_titans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_samurai_jack_AND_teen_titans(Interval).

samurai_jack_AND_teen_titans_at_2004(Res) :- setof((Start,End),samurai_jack_AND_teen_titans(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = samurai_jack_AND_teen_titans_at_2004'), (samurai_jack_AND_teen_titans_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- samurai_jack_AND_teen_titans_aux().

