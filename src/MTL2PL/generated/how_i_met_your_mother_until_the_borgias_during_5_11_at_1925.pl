:- include('database.pl').
how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

the_borgias(Start,End) :- begin('the_borgias',_,_,Start), end('the_borgias',_,_,End), Start=<End.

how_i_met_your_mother_last_till_5_11(Start,End) :- how_i_met_your_mother(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

how_i_met_your_mother_until_the_borgias_during_5_11_overlap(Start,End) :- how_i_met_your_mother_last_till_5_11(Start1,End1), the_borgias(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

how_i_met_your_mother_until_the_borgias_during_5_11(Start,End) :- how_i_met_your_mother(W1,_), how_i_met_your_mother_until_the_borgias_during_5_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-5), Start=<End.

how_i_met_your_mother_until_the_borgias_during_5_11_at_1925(Res) :- setof((Start,End),how_i_met_your_mother_until_the_borgias_during_5_11(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = how_i_met_your_mother_until_the_borgias_during_5_11_at_1925'), (how_i_met_your_mother_until_the_borgias_during_5_11_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

