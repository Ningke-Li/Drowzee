:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

generate_facts_criminal_minds_AND_ncis__new_orleans([]) :- assert(criminal_minds_AND_ncis__new_orleans(-1,-1)).

generate_facts_criminal_minds_AND_ncis__new_orleans([(Start,End) | Tail]) :- assert(criminal_minds_AND_ncis__new_orleans(Start,End)), generate_facts_criminal_minds_AND_ncis__new_orleans(Tail).

criminal_minds_AND_ncis__new_orleans_aux() :- findall((Start,End),criminal_minds(Start,End),Interval1), findall((Start,End),ncis__new_orleans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_criminal_minds_AND_ncis__new_orleans(Interval).

criminal_minds_AND_ncis__new_orleans_at_1884(Res) :- setof((Start,End),criminal_minds_AND_ncis__new_orleans(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = criminal_minds_AND_ncis__new_orleans_at_1884'), (criminal_minds_AND_ncis__new_orleans_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).
?- criminal_minds_AND_ncis__new_orleans_aux().

