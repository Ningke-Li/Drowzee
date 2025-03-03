:- include('database.pl').
deutsche_mark(Start,End) :- begin('deutsche_mark',_,_,Start), end('deutsche_mark',_,_,End), Start=<End.

first_indochina_war(Start,End) :- begin('first_indochina_war',_,_,Start), end('first_indochina_war',_,_,End), Start=<End.

generate_facts_deutsche_mark_AND_first_indochina_war([]) :- assert(deutsche_mark_AND_first_indochina_war(-1,-1)).

generate_facts_deutsche_mark_AND_first_indochina_war([(Start,End) | Tail]) :- assert(deutsche_mark_AND_first_indochina_war(Start,End)), generate_facts_deutsche_mark_AND_first_indochina_war(Tail).

deutsche_mark_AND_first_indochina_war_aux() :- findall((Start,End),deutsche_mark(Start,End),Interval1), findall((Start,End),first_indochina_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_deutsche_mark_AND_first_indochina_war(Interval).

deutsche_mark_AND_first_indochina_war_at_1833(Res) :- setof((Start,End),deutsche_mark_AND_first_indochina_war(Start,End),AllINtervals), checkvalidity(1833,AllINtervals,Res).

check_query() :- write('Query = deutsche_mark_AND_first_indochina_war_at_1833'), (deutsche_mark_AND_first_indochina_war_at_1833(true) -> write('\nRes   = true');write('\nRes   = false')).
?- deutsche_mark_AND_first_indochina_war_aux().

