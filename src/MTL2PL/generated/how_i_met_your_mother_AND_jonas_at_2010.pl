:- include('database.pl').
how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

generate_facts_how_i_met_your_mother_AND_jonas([]) :- assert(how_i_met_your_mother_AND_jonas(-1,-1)).

generate_facts_how_i_met_your_mother_AND_jonas([(Start,End) | Tail]) :- assert(how_i_met_your_mother_AND_jonas(Start,End)), generate_facts_how_i_met_your_mother_AND_jonas(Tail).

how_i_met_your_mother_AND_jonas_aux() :- findall((Start,End),how_i_met_your_mother(Start,End),Interval1), findall((Start,End),jonas(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_how_i_met_your_mother_AND_jonas(Interval).

how_i_met_your_mother_AND_jonas_at_2010(Res) :- setof((Start,End),how_i_met_your_mother_AND_jonas(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = how_i_met_your_mother_AND_jonas_at_2010'), (how_i_met_your_mother_AND_jonas_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- how_i_met_your_mother_AND_jonas_aux().

