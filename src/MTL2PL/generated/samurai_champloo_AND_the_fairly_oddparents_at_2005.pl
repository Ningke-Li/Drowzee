:- include('database.pl').
samurai_champloo(Start,End) :- begin('samurai_champloo',_,_,Start), end('samurai_champloo',_,_,End), Start=<End.

the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

generate_facts_samurai_champloo_AND_the_fairly_oddparents([]) :- assert(samurai_champloo_AND_the_fairly_oddparents(-1,-1)).

generate_facts_samurai_champloo_AND_the_fairly_oddparents([(Start,End) | Tail]) :- assert(samurai_champloo_AND_the_fairly_oddparents(Start,End)), generate_facts_samurai_champloo_AND_the_fairly_oddparents(Tail).

samurai_champloo_AND_the_fairly_oddparents_aux() :- findall((Start,End),samurai_champloo(Start,End),Interval1), findall((Start,End),the_fairly_oddparents(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_samurai_champloo_AND_the_fairly_oddparents(Interval).

samurai_champloo_AND_the_fairly_oddparents_at_2005(Res) :- setof((Start,End),samurai_champloo_AND_the_fairly_oddparents(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = samurai_champloo_AND_the_fairly_oddparents_at_2005'), (samurai_champloo_AND_the_fairly_oddparents_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- samurai_champloo_AND_the_fairly_oddparents_aux().

