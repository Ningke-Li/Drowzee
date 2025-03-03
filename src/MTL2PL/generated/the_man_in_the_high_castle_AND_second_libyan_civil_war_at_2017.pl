:- include('database.pl').
the_man_in_the_high_castle(Start,End) :- begin('the_man_in_the_high_castle',_,_,Start), end('the_man_in_the_high_castle',_,_,End), Start=<End.

second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

generate_facts_the_man_in_the_high_castle_AND_second_libyan_civil_war([]) :- assert(the_man_in_the_high_castle_AND_second_libyan_civil_war(-1,-1)).

generate_facts_the_man_in_the_high_castle_AND_second_libyan_civil_war([(Start,End) | Tail]) :- assert(the_man_in_the_high_castle_AND_second_libyan_civil_war(Start,End)), generate_facts_the_man_in_the_high_castle_AND_second_libyan_civil_war(Tail).

the_man_in_the_high_castle_AND_second_libyan_civil_war_aux() :- findall((Start,End),the_man_in_the_high_castle(Start,End),Interval1), findall((Start,End),second_libyan_civil_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_man_in_the_high_castle_AND_second_libyan_civil_war(Interval).

the_man_in_the_high_castle_AND_second_libyan_civil_war_at_2017(Res) :- setof((Start,End),the_man_in_the_high_castle_AND_second_libyan_civil_war(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = the_man_in_the_high_castle_AND_second_libyan_civil_war_at_2017'), (the_man_in_the_high_castle_AND_second_libyan_civil_war_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_man_in_the_high_castle_AND_second_libyan_civil_war_aux().

