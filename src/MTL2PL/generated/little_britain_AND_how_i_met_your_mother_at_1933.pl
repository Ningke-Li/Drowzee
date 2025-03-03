:- include('database.pl').
little_britain(Start,End) :- begin('little_britain',_,_,Start), end('little_britain',_,_,End), Start=<End.

how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

generate_facts_little_britain_AND_how_i_met_your_mother([]) :- assert(little_britain_AND_how_i_met_your_mother(-1,-1)).

generate_facts_little_britain_AND_how_i_met_your_mother([(Start,End) | Tail]) :- assert(little_britain_AND_how_i_met_your_mother(Start,End)), generate_facts_little_britain_AND_how_i_met_your_mother(Tail).

little_britain_AND_how_i_met_your_mother_aux() :- findall((Start,End),little_britain(Start,End),Interval1), findall((Start,End),how_i_met_your_mother(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_little_britain_AND_how_i_met_your_mother(Interval).

little_britain_AND_how_i_met_your_mother_at_1933(Res) :- setof((Start,End),little_britain_AND_how_i_met_your_mother(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = little_britain_AND_how_i_met_your_mother_at_1933'), (little_britain_AND_how_i_met_your_mother_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- little_britain_AND_how_i_met_your_mother_aux().

