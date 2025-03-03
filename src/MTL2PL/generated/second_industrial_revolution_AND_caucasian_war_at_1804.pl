:- include('database.pl').
second_industrial_revolution(Start,End) :- begin('second_industrial_revolution',_,_,Start), end('second_industrial_revolution',_,_,End), Start=<End.

caucasian_war(Start,End) :- begin('caucasian_war',_,_,Start), end('caucasian_war',_,_,End), Start=<End.

generate_facts_second_industrial_revolution_AND_caucasian_war([]) :- assert(second_industrial_revolution_AND_caucasian_war(-1,-1)).

generate_facts_second_industrial_revolution_AND_caucasian_war([(Start,End) | Tail]) :- assert(second_industrial_revolution_AND_caucasian_war(Start,End)), generate_facts_second_industrial_revolution_AND_caucasian_war(Tail).

second_industrial_revolution_AND_caucasian_war_aux() :- findall((Start,End),second_industrial_revolution(Start,End),Interval1), findall((Start,End),caucasian_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_second_industrial_revolution_AND_caucasian_war(Interval).

second_industrial_revolution_AND_caucasian_war_at_1804(Res) :- setof((Start,End),second_industrial_revolution_AND_caucasian_war(Start,End),AllINtervals), checkvalidity(1804,AllINtervals,Res).

check_query() :- write('Query = second_industrial_revolution_AND_caucasian_war_at_1804'), (second_industrial_revolution_AND_caucasian_war_at_1804(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_industrial_revolution_AND_caucasian_war_aux().

