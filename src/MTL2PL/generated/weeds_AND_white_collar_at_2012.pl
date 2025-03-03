:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

generate_facts_weeds_AND_white_collar([]) :- assert(weeds_AND_white_collar(-1,-1)).

generate_facts_weeds_AND_white_collar([(Start,End) | Tail]) :- assert(weeds_AND_white_collar(Start,End)), generate_facts_weeds_AND_white_collar(Tail).

weeds_AND_white_collar_aux() :- findall((Start,End),weeds(Start,End),Interval1), findall((Start,End),white_collar(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_weeds_AND_white_collar(Interval).

weeds_AND_white_collar_at_2012(Res) :- setof((Start,End),weeds_AND_white_collar(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = weeds_AND_white_collar_at_2012'), (weeds_AND_white_collar_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- weeds_AND_white_collar_aux().

