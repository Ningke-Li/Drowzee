:- include('database.pl').
jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

marco_polo(Start,End) :- begin('marco_polo',_,_,Start), end('marco_polo',_,_,End), Start=<End.

generate_facts_jessie_AND_marco_polo([]) :- assert(jessie_AND_marco_polo(-1,-1)).

generate_facts_jessie_AND_marco_polo([(Start,End) | Tail]) :- assert(jessie_AND_marco_polo(Start,End)), generate_facts_jessie_AND_marco_polo(Tail).

jessie_AND_marco_polo_aux() :- findall((Start,End),jessie(Start,End),Interval1), findall((Start,End),marco_polo(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jessie_AND_marco_polo(Interval).

jessie_AND_marco_polo_at_2020(Res) :- setof((Start,End),jessie_AND_marco_polo(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = jessie_AND_marco_polo_at_2020'), (jessie_AND_marco_polo_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jessie_AND_marco_polo_aux().

