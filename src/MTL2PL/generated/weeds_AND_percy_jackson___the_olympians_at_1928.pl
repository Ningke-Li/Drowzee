:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

percy_jackson___the_olympians(Start,End) :- begin('percy_jackson___the_olympians',_,_,Start), end('percy_jackson___the_olympians',_,_,End), Start=<End.

generate_facts_weeds_AND_percy_jackson___the_olympians([]) :- assert(weeds_AND_percy_jackson___the_olympians(-1,-1)).

generate_facts_weeds_AND_percy_jackson___the_olympians([(Start,End) | Tail]) :- assert(weeds_AND_percy_jackson___the_olympians(Start,End)), generate_facts_weeds_AND_percy_jackson___the_olympians(Tail).

weeds_AND_percy_jackson___the_olympians_aux() :- findall((Start,End),weeds(Start,End),Interval1), findall((Start,End),percy_jackson___the_olympians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_weeds_AND_percy_jackson___the_olympians(Interval).

weeds_AND_percy_jackson___the_olympians_at_1928(Res) :- setof((Start,End),weeds_AND_percy_jackson___the_olympians(Start,End),AllINtervals), checkvalidity(1928,AllINtervals,Res).

check_query() :- write('Query = weeds_AND_percy_jackson___the_olympians_at_1928'), (weeds_AND_percy_jackson___the_olympians_at_1928(true) -> write('\nRes   = true');write('\nRes   = false')).
?- weeds_AND_percy_jackson___the_olympians_aux().

