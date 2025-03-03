:- include('database.pl').
first_anglo_sikh_war(Start,End) :- begin('first_anglo_sikh_war',_,_,Start), end('first_anglo_sikh_war',_,_,End), Start=<End.

dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

generate_facts_first_anglo_sikh_war_OR_dr__romantic([]) :- assert(first_anglo_sikh_war_OR_dr__romantic(-1,-1)).

generate_facts_first_anglo_sikh_war_OR_dr__romantic([(Start,End) | Tail]) :- assert(first_anglo_sikh_war_OR_dr__romantic(Start,End)), generate_facts_first_anglo_sikh_war_OR_dr__romantic(Tail).

first_anglo_sikh_war_OR_dr__romantic_aux() :- findall((Start,End),first_anglo_sikh_war(Start,End),Interval1), findall((Start,End),dr__romantic(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_anglo_sikh_war_OR_dr__romantic(Interval).

first_anglo_sikh_war_OR_dr__romantic_at_1883(Res) :- setof((Start,End),first_anglo_sikh_war_OR_dr__romantic(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = first_anglo_sikh_war_OR_dr__romantic_at_1883'), (first_anglo_sikh_war_OR_dr__romantic_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_anglo_sikh_war_OR_dr__romantic_aux().

