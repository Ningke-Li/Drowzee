:- include('database.pl').
anglo_iraqi_war(Start,End) :- begin('anglo_iraqi_war',_,_,Start), end('anglo_iraqi_war',_,_,End), Start=<End.

prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

generate_facts_anglo_iraqi_war_OR_prison_break([]) :- assert(anglo_iraqi_war_OR_prison_break(-1,-1)).

generate_facts_anglo_iraqi_war_OR_prison_break([(Start,End) | Tail]) :- assert(anglo_iraqi_war_OR_prison_break(Start,End)), generate_facts_anglo_iraqi_war_OR_prison_break(Tail).

anglo_iraqi_war_OR_prison_break_aux() :- findall((Start,End),anglo_iraqi_war(Start,End),Interval1), findall((Start,End),prison_break(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_anglo_iraqi_war_OR_prison_break(Interval).

anglo_iraqi_war_OR_prison_break_at_2054(Res) :- setof((Start,End),anglo_iraqi_war_OR_prison_break(Start,End),AllINtervals), checkvalidity(2054,AllINtervals,Res).

check_query() :- write('Query = anglo_iraqi_war_OR_prison_break_at_2054'), (anglo_iraqi_war_OR_prison_break_at_2054(true) -> write('\nRes   = true');write('\nRes   = false')).
?- anglo_iraqi_war_OR_prison_break_aux().

