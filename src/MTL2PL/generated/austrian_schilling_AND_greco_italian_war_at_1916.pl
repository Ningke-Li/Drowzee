:- include('database.pl').
austrian_schilling(Start,End) :- begin('austrian_schilling',_,_,Start), end('austrian_schilling',_,_,End), Start=<End.

greco_italian_war(Start,End) :- begin('greco_italian_war',_,_,Start), end('greco_italian_war',_,_,End), Start=<End.

generate_facts_austrian_schilling_AND_greco_italian_war([]) :- assert(austrian_schilling_AND_greco_italian_war(-1,-1)).

generate_facts_austrian_schilling_AND_greco_italian_war([(Start,End) | Tail]) :- assert(austrian_schilling_AND_greco_italian_war(Start,End)), generate_facts_austrian_schilling_AND_greco_italian_war(Tail).

austrian_schilling_AND_greco_italian_war_aux() :- findall((Start,End),austrian_schilling(Start,End),Interval1), findall((Start,End),greco_italian_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_austrian_schilling_AND_greco_italian_war(Interval).

austrian_schilling_AND_greco_italian_war_at_1916(Res) :- setof((Start,End),austrian_schilling_AND_greco_italian_war(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = austrian_schilling_AND_greco_italian_war_at_1916'), (austrian_schilling_AND_greco_italian_war_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austrian_schilling_AND_greco_italian_war_aux().

