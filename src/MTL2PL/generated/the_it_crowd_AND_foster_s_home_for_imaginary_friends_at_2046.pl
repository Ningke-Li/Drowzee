:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

generate_facts_the_it_crowd_AND_foster_s_home_for_imaginary_friends([]) :- assert(the_it_crowd_AND_foster_s_home_for_imaginary_friends(-1,-1)).

generate_facts_the_it_crowd_AND_foster_s_home_for_imaginary_friends([(Start,End) | Tail]) :- assert(the_it_crowd_AND_foster_s_home_for_imaginary_friends(Start,End)), generate_facts_the_it_crowd_AND_foster_s_home_for_imaginary_friends(Tail).

the_it_crowd_AND_foster_s_home_for_imaginary_friends_aux() :- findall((Start,End),the_it_crowd(Start,End),Interval1), findall((Start,End),foster_s_home_for_imaginary_friends(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_it_crowd_AND_foster_s_home_for_imaginary_friends(Interval).

the_it_crowd_AND_foster_s_home_for_imaginary_friends_at_2046(Res) :- setof((Start,End),the_it_crowd_AND_foster_s_home_for_imaginary_friends(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = the_it_crowd_AND_foster_s_home_for_imaginary_friends_at_2046'), (the_it_crowd_AND_foster_s_home_for_imaginary_friends_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_it_crowd_AND_foster_s_home_for_imaginary_friends_aux().

