:- include('database.pl').
the_emperor_s_new_school(Start,End) :- begin('the_emperor_s_new_school',_,_,Start), end('the_emperor_s_new_school',_,_,End), Start=<End.

quantico(Start,End) :- begin('quantico',_,_,Start), end('quantico',_,_,End), Start=<End.

generate_facts_the_emperor_s_new_school_OR_quantico([]) :- assert(the_emperor_s_new_school_OR_quantico(-1,-1)).

generate_facts_the_emperor_s_new_school_OR_quantico([(Start,End) | Tail]) :- assert(the_emperor_s_new_school_OR_quantico(Start,End)), generate_facts_the_emperor_s_new_school_OR_quantico(Tail).

the_emperor_s_new_school_OR_quantico_aux() :- findall((Start,End),the_emperor_s_new_school(Start,End),Interval1), findall((Start,End),quantico(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_emperor_s_new_school_OR_quantico(Interval).

the_emperor_s_new_school_OR_quantico_at_2016(Res) :- setof((Start,End),the_emperor_s_new_school_OR_quantico(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = the_emperor_s_new_school_OR_quantico_at_2016'), (the_emperor_s_new_school_OR_quantico_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_emperor_s_new_school_OR_quantico_aux().

