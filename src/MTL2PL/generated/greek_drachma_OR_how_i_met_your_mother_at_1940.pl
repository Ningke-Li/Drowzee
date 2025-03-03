:- include('database.pl').
greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

generate_facts_greek_drachma_OR_how_i_met_your_mother([]) :- assert(greek_drachma_OR_how_i_met_your_mother(-1,-1)).

generate_facts_greek_drachma_OR_how_i_met_your_mother([(Start,End) | Tail]) :- assert(greek_drachma_OR_how_i_met_your_mother(Start,End)), generate_facts_greek_drachma_OR_how_i_met_your_mother(Tail).

greek_drachma_OR_how_i_met_your_mother_aux() :- findall((Start,End),greek_drachma(Start,End),Interval1), findall((Start,End),how_i_met_your_mother(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_greek_drachma_OR_how_i_met_your_mother(Interval).

greek_drachma_OR_how_i_met_your_mother_at_1940(Res) :- setof((Start,End),greek_drachma_OR_how_i_met_your_mother(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = greek_drachma_OR_how_i_met_your_mother_at_1940'), (greek_drachma_OR_how_i_met_your_mother_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_drachma_OR_how_i_met_your_mother_aux().

