:- include('database.pl').
splash_and_bubbles(Start,End) :- begin('splash_and_bubbles',_,_,Start), end('splash_and_bubbles',_,_,End), Start=<End.

the_expanse(Start,End) :- begin('the_expanse',_,_,Start), end('the_expanse',_,_,End), Start=<End.

generate_facts_splash_and_bubbles_AND_the_expanse([]) :- assert(splash_and_bubbles_AND_the_expanse(-1,-1)).

generate_facts_splash_and_bubbles_AND_the_expanse([(Start,End) | Tail]) :- assert(splash_and_bubbles_AND_the_expanse(Start,End)), generate_facts_splash_and_bubbles_AND_the_expanse(Tail).

splash_and_bubbles_AND_the_expanse_aux() :- findall((Start,End),splash_and_bubbles(Start,End),Interval1), findall((Start,End),the_expanse(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_splash_and_bubbles_AND_the_expanse(Interval).

splash_and_bubbles_AND_the_expanse_at_2017(Res) :- setof((Start,End),splash_and_bubbles_AND_the_expanse(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = splash_and_bubbles_AND_the_expanse_at_2017'), (splash_and_bubbles_AND_the_expanse_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- splash_and_bubbles_AND_the_expanse_aux().

