:- include('database.pl').
hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

generate_facts_hawaii_five_0_AND_criminal_minds([]) :- assert(hawaii_five_0_AND_criminal_minds(-1,-1)).

generate_facts_hawaii_five_0_AND_criminal_minds([(Start,End) | Tail]) :- assert(hawaii_five_0_AND_criminal_minds(Start,End)), generate_facts_hawaii_five_0_AND_criminal_minds(Tail).

hawaii_five_0_AND_criminal_minds_aux() :- findall((Start,End),hawaii_five_0(Start,End),Interval1), findall((Start,End),criminal_minds(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_hawaii_five_0_AND_criminal_minds(Interval).

hawaii_five_0_AND_criminal_minds_at_2011(Res) :- setof((Start,End),hawaii_five_0_AND_criminal_minds(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = hawaii_five_0_AND_criminal_minds_at_2011'), (hawaii_five_0_AND_criminal_minds_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hawaii_five_0_AND_criminal_minds_aux().

