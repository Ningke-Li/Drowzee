:- include('database.pl').
second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

generate_facts_second_libyan_civil_war_AND_the_vampire_diaries([]) :- assert(second_libyan_civil_war_AND_the_vampire_diaries(-1,-1)).

generate_facts_second_libyan_civil_war_AND_the_vampire_diaries([(Start,End) | Tail]) :- assert(second_libyan_civil_war_AND_the_vampire_diaries(Start,End)), generate_facts_second_libyan_civil_war_AND_the_vampire_diaries(Tail).

second_libyan_civil_war_AND_the_vampire_diaries_aux() :- findall((Start,End),second_libyan_civil_war(Start,End),Interval1), findall((Start,End),the_vampire_diaries(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_second_libyan_civil_war_AND_the_vampire_diaries(Interval).

second_libyan_civil_war_AND_the_vampire_diaries_at_2017(Res) :- setof((Start,End),second_libyan_civil_war_AND_the_vampire_diaries(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = second_libyan_civil_war_AND_the_vampire_diaries_at_2017'), (second_libyan_civil_war_AND_the_vampire_diaries_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_libyan_civil_war_AND_the_vampire_diaries_aux().

