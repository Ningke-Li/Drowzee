:- include('database.pl').
lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

generate_facts_lithuanian_litas_AND_the_fairly_oddparents([]) :- assert(lithuanian_litas_AND_the_fairly_oddparents(-1,-1)).

generate_facts_lithuanian_litas_AND_the_fairly_oddparents([(Start,End) | Tail]) :- assert(lithuanian_litas_AND_the_fairly_oddparents(Start,End)), generate_facts_lithuanian_litas_AND_the_fairly_oddparents(Tail).

lithuanian_litas_AND_the_fairly_oddparents_aux() :- findall((Start,End),lithuanian_litas(Start,End),Interval1), findall((Start,End),the_fairly_oddparents(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_lithuanian_litas_AND_the_fairly_oddparents(Interval).

lithuanian_litas_AND_the_fairly_oddparents_at_2007(Res) :- setof((Start,End),lithuanian_litas_AND_the_fairly_oddparents(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = lithuanian_litas_AND_the_fairly_oddparents_at_2007'), (lithuanian_litas_AND_the_fairly_oddparents_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lithuanian_litas_AND_the_fairly_oddparents_aux().

