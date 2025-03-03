:- include('database.pl').
liv_and_maddie(Start,End) :- begin('liv_and_maddie',_,_,Start), end('liv_and_maddie',_,_,End), Start=<End.

how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

generate_facts_liv_and_maddie_AND_how_i_met_your_mother([]) :- assert(liv_and_maddie_AND_how_i_met_your_mother(-1,-1)).

generate_facts_liv_and_maddie_AND_how_i_met_your_mother([(Start,End) | Tail]) :- assert(liv_and_maddie_AND_how_i_met_your_mother(Start,End)), generate_facts_liv_and_maddie_AND_how_i_met_your_mother(Tail).

liv_and_maddie_AND_how_i_met_your_mother_aux() :- findall((Start,End),liv_and_maddie(Start,End),Interval1), findall((Start,End),how_i_met_your_mother(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_liv_and_maddie_AND_how_i_met_your_mother(Interval).

liv_and_maddie_AND_how_i_met_your_mother_at_2013(Res) :- setof((Start,End),liv_and_maddie_AND_how_i_met_your_mother(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = liv_and_maddie_AND_how_i_met_your_mother_at_2013'), (liv_and_maddie_AND_how_i_met_your_mother_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- liv_and_maddie_AND_how_i_met_your_mother_aux().

