:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

gilmore_girls(Start,End) :- begin('gilmore_girls',_,_,Start), end('gilmore_girls',_,_,End), Start=<End.

generate_facts_weeds_AND_gilmore_girls([]) :- assert(weeds_AND_gilmore_girls(-1,-1)).

generate_facts_weeds_AND_gilmore_girls([(Start,End) | Tail]) :- assert(weeds_AND_gilmore_girls(Start,End)), generate_facts_weeds_AND_gilmore_girls(Tail).

weeds_AND_gilmore_girls_aux() :- findall((Start,End),weeds(Start,End),Interval1), findall((Start,End),gilmore_girls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_weeds_AND_gilmore_girls(Interval).

weeds_AND_gilmore_girls_at_1972(Res) :- setof((Start,End),weeds_AND_gilmore_girls(Start,End),AllINtervals), checkvalidity(1972,AllINtervals,Res).

check_query() :- write('Query = weeds_AND_gilmore_girls_at_1972'), (weeds_AND_gilmore_girls_at_1972(true) -> write('\nRes   = true');write('\nRes   = false')).
?- weeds_AND_gilmore_girls_aux().

