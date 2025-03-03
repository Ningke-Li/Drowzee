:- include('database.pl').
foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

generate_facts_foster_s_home_for_imaginary_friends_AND_man_vs__wild([]) :- assert(foster_s_home_for_imaginary_friends_AND_man_vs__wild(-1,-1)).

generate_facts_foster_s_home_for_imaginary_friends_AND_man_vs__wild([(Start,End) | Tail]) :- assert(foster_s_home_for_imaginary_friends_AND_man_vs__wild(Start,End)), generate_facts_foster_s_home_for_imaginary_friends_AND_man_vs__wild(Tail).

foster_s_home_for_imaginary_friends_AND_man_vs__wild_aux() :- findall((Start,End),foster_s_home_for_imaginary_friends(Start,End),Interval1), findall((Start,End),man_vs__wild(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_foster_s_home_for_imaginary_friends_AND_man_vs__wild(Interval).

foster_s_home_for_imaginary_friends_AND_man_vs__wild_at_1894(Res) :- setof((Start,End),foster_s_home_for_imaginary_friends_AND_man_vs__wild(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = foster_s_home_for_imaginary_friends_AND_man_vs__wild_at_1894'), (foster_s_home_for_imaginary_friends_AND_man_vs__wild_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- foster_s_home_for_imaginary_friends_AND_man_vs__wild_aux().

