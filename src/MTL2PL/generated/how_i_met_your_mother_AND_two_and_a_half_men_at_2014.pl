:- include('database.pl').
how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

two_and_a_half_men(Start,End) :- begin('two_and_a_half_men',_,_,Start), end('two_and_a_half_men',_,_,End), Start=<End.

generate_facts_how_i_met_your_mother_AND_two_and_a_half_men([]) :- assert(how_i_met_your_mother_AND_two_and_a_half_men(-1,-1)).

generate_facts_how_i_met_your_mother_AND_two_and_a_half_men([(Start,End) | Tail]) :- assert(how_i_met_your_mother_AND_two_and_a_half_men(Start,End)), generate_facts_how_i_met_your_mother_AND_two_and_a_half_men(Tail).

how_i_met_your_mother_AND_two_and_a_half_men_aux() :- findall((Start,End),how_i_met_your_mother(Start,End),Interval1), findall((Start,End),two_and_a_half_men(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_how_i_met_your_mother_AND_two_and_a_half_men(Interval).

how_i_met_your_mother_AND_two_and_a_half_men_at_2014(Res) :- setof((Start,End),how_i_met_your_mother_AND_two_and_a_half_men(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = how_i_met_your_mother_AND_two_and_a_half_men_at_2014'), (how_i_met_your_mother_AND_two_and_a_half_men_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- how_i_met_your_mother_AND_two_and_a_half_men_aux().

