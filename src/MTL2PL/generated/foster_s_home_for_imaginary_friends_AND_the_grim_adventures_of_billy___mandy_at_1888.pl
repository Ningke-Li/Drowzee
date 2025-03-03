:- include('database.pl').
foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

generate_facts_foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy([]) :- assert(foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy(-1,-1)).

generate_facts_foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy([(Start,End) | Tail]) :- assert(foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy(Start,End)), generate_facts_foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy(Tail).

foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy_aux() :- findall((Start,End),foster_s_home_for_imaginary_friends(Start,End),Interval1), findall((Start,End),the_grim_adventures_of_billy___mandy(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy(Interval).

foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy_at_1888(Res) :- setof((Start,End),foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy_at_1888'), (foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).
?- foster_s_home_for_imaginary_friends_AND_the_grim_adventures_of_billy___mandy_aux().

