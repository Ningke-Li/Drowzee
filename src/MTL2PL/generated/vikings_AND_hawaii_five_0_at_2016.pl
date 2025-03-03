:- include('database.pl').
vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

generate_facts_vikings_AND_hawaii_five_0([]) :- assert(vikings_AND_hawaii_five_0(-1,-1)).

generate_facts_vikings_AND_hawaii_five_0([(Start,End) | Tail]) :- assert(vikings_AND_hawaii_five_0(Start,End)), generate_facts_vikings_AND_hawaii_five_0(Tail).

vikings_AND_hawaii_five_0_aux() :- findall((Start,End),vikings(Start,End),Interval1), findall((Start,End),hawaii_five_0(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_vikings_AND_hawaii_five_0(Interval).

vikings_AND_hawaii_five_0_at_2016(Res) :- setof((Start,End),vikings_AND_hawaii_five_0(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = vikings_AND_hawaii_five_0_at_2016'), (vikings_AND_hawaii_five_0_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- vikings_AND_hawaii_five_0_aux().

