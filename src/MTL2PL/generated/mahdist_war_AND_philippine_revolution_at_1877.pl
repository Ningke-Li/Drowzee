:- include('database.pl').
mahdist_war(Start,End) :- begin('mahdist_war',_,_,Start), end('mahdist_war',_,_,End), Start=<End.

philippine_revolution(Start,End) :- begin('philippine_revolution',_,_,Start), end('philippine_revolution',_,_,End), Start=<End.

generate_facts_mahdist_war_AND_philippine_revolution([]) :- assert(mahdist_war_AND_philippine_revolution(-1,-1)).

generate_facts_mahdist_war_AND_philippine_revolution([(Start,End) | Tail]) :- assert(mahdist_war_AND_philippine_revolution(Start,End)), generate_facts_mahdist_war_AND_philippine_revolution(Tail).

mahdist_war_AND_philippine_revolution_aux() :- findall((Start,End),mahdist_war(Start,End),Interval1), findall((Start,End),philippine_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mahdist_war_AND_philippine_revolution(Interval).

mahdist_war_AND_philippine_revolution_at_1877(Res) :- setof((Start,End),mahdist_war_AND_philippine_revolution(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = mahdist_war_AND_philippine_revolution_at_1877'), (mahdist_war_AND_philippine_revolution_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mahdist_war_AND_philippine_revolution_aux().

