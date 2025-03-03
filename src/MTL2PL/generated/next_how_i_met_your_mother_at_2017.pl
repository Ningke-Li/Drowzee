:- include('database.pl').
how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

next_how_i_met_your_mother(Start,End) :- how_i_met_your_mother(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_how_i_met_your_mother_at_2017(Res) :- setof((Start,End),next_how_i_met_your_mother(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = next_how_i_met_your_mother_at_2017'), (next_how_i_met_your_mother_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).

