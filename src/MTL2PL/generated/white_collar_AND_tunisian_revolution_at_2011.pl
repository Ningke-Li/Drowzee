:- include('database.pl').
white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

tunisian_revolution(Start,End) :- begin('tunisian_revolution',_,_,Start), end('tunisian_revolution',_,_,End), Start=<End.

generate_facts_white_collar_AND_tunisian_revolution([]) :- assert(white_collar_AND_tunisian_revolution(-1,-1)).

generate_facts_white_collar_AND_tunisian_revolution([(Start,End) | Tail]) :- assert(white_collar_AND_tunisian_revolution(Start,End)), generate_facts_white_collar_AND_tunisian_revolution(Tail).

white_collar_AND_tunisian_revolution_aux() :- findall((Start,End),white_collar(Start,End),Interval1), findall((Start,End),tunisian_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_white_collar_AND_tunisian_revolution(Interval).

white_collar_AND_tunisian_revolution_at_2011(Res) :- setof((Start,End),white_collar_AND_tunisian_revolution(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = white_collar_AND_tunisian_revolution_at_2011'), (white_collar_AND_tunisian_revolution_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- white_collar_AND_tunisian_revolution_aux().

