:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

gaza_war__2008_2009_(Start,End) :- begin('gaza_war__2008_2009_',_,_,Start), end('gaza_war__2008_2009_',_,_,End), Start=<End.

generate_facts_dora_the_explorer_AND_gaza_war__2008_2009_([]) :- assert(dora_the_explorer_AND_gaza_war__2008_2009_(-1,-1)).

generate_facts_dora_the_explorer_AND_gaza_war__2008_2009_([(Start,End) | Tail]) :- assert(dora_the_explorer_AND_gaza_war__2008_2009_(Start,End)), generate_facts_dora_the_explorer_AND_gaza_war__2008_2009_(Tail).

dora_the_explorer_AND_gaza_war__2008_2009__aux() :- findall((Start,End),dora_the_explorer(Start,End),Interval1), findall((Start,End),gaza_war__2008_2009_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dora_the_explorer_AND_gaza_war__2008_2009_(Interval).

dora_the_explorer_AND_gaza_war__2008_2009__at_2009(Res) :- setof((Start,End),dora_the_explorer_AND_gaza_war__2008_2009_(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_AND_gaza_war__2008_2009__at_2009'), (dora_the_explorer_AND_gaza_war__2008_2009__at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dora_the_explorer_AND_gaza_war__2008_2009__aux().

