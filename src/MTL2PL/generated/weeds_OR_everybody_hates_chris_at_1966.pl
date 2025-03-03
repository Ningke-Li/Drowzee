:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

everybody_hates_chris(Start,End) :- begin('everybody_hates_chris',_,_,Start), end('everybody_hates_chris',_,_,End), Start=<End.

generate_facts_weeds_OR_everybody_hates_chris([]) :- assert(weeds_OR_everybody_hates_chris(-1,-1)).

generate_facts_weeds_OR_everybody_hates_chris([(Start,End) | Tail]) :- assert(weeds_OR_everybody_hates_chris(Start,End)), generate_facts_weeds_OR_everybody_hates_chris(Tail).

weeds_OR_everybody_hates_chris_aux() :- findall((Start,End),weeds(Start,End),Interval1), findall((Start,End),everybody_hates_chris(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_weeds_OR_everybody_hates_chris(Interval).

weeds_OR_everybody_hates_chris_at_1966(Res) :- setof((Start,End),weeds_OR_everybody_hates_chris(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = weeds_OR_everybody_hates_chris_at_1966'), (weeds_OR_everybody_hates_chris_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).
?- weeds_OR_everybody_hates_chris_aux().

