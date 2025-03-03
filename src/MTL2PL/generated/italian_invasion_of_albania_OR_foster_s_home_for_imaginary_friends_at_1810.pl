:- include('database.pl').
italian_invasion_of_albania(Start,End) :- begin('italian_invasion_of_albania',_,_,Start), end('italian_invasion_of_albania',_,_,End), Start=<End.

foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

generate_facts_italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends([]) :- assert(italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends(-1,-1)).

generate_facts_italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends([(Start,End) | Tail]) :- assert(italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends(Start,End)), generate_facts_italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends(Tail).

italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends_aux() :- findall((Start,End),italian_invasion_of_albania(Start,End),Interval1), findall((Start,End),foster_s_home_for_imaginary_friends(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends(Interval).

italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends_at_1810(Res) :- setof((Start,End),italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends(Start,End),AllINtervals), checkvalidity(1810,AllINtervals,Res).

check_query() :- write('Query = italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends_at_1810'), (italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends_at_1810(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_invasion_of_albania_OR_foster_s_home_for_imaginary_friends_aux().

