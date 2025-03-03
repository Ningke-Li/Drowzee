:- include('database.pl').
percy_jackson___the_olympians(Start,End) :- begin('percy_jackson___the_olympians',_,_,Start), end('percy_jackson___the_olympians',_,_,End), Start=<End.

ben_10(Start,End) :- begin('ben_10',_,_,Start), end('ben_10',_,_,End), Start=<End.

generate_facts_percy_jackson___the_olympians_AND_ben_10([]) :- assert(percy_jackson___the_olympians_AND_ben_10(-1,-1)).

generate_facts_percy_jackson___the_olympians_AND_ben_10([(Start,End) | Tail]) :- assert(percy_jackson___the_olympians_AND_ben_10(Start,End)), generate_facts_percy_jackson___the_olympians_AND_ben_10(Tail).

percy_jackson___the_olympians_AND_ben_10_aux() :- findall((Start,End),percy_jackson___the_olympians(Start,End),Interval1), findall((Start,End),ben_10(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_percy_jackson___the_olympians_AND_ben_10(Interval).

percy_jackson___the_olympians_AND_ben_10_at_1873(Res) :- setof((Start,End),percy_jackson___the_olympians_AND_ben_10(Start,End),AllINtervals), checkvalidity(1873,AllINtervals,Res).

check_query() :- write('Query = percy_jackson___the_olympians_AND_ben_10_at_1873'), (percy_jackson___the_olympians_AND_ben_10_at_1873(true) -> write('\nRes   = true');write('\nRes   = false')).
?- percy_jackson___the_olympians_AND_ben_10_aux().

