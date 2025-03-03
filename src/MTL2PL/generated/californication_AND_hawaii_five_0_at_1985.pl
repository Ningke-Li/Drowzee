:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

generate_facts_californication_AND_hawaii_five_0([]) :- assert(californication_AND_hawaii_five_0(-1,-1)).

generate_facts_californication_AND_hawaii_five_0([(Start,End) | Tail]) :- assert(californication_AND_hawaii_five_0(Start,End)), generate_facts_californication_AND_hawaii_five_0(Tail).

californication_AND_hawaii_five_0_aux() :- findall((Start,End),californication(Start,End),Interval1), findall((Start,End),hawaii_five_0(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_californication_AND_hawaii_five_0(Interval).

californication_AND_hawaii_five_0_at_1985(Res) :- setof((Start,End),californication_AND_hawaii_five_0(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = californication_AND_hawaii_five_0_at_1985'), (californication_AND_hawaii_five_0_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).
?- californication_AND_hawaii_five_0_aux().

