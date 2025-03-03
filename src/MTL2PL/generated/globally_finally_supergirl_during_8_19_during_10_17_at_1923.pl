:- include('database.pl').
supergirl(Start,End) :- begin('supergirl',_,_,Start), end('supergirl',_,_,End), Start=<End.

finally_supergirl_during_8_19(Start,End) :- supergirl(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

globally_finally_supergirl_during_8_19_during_10_17(Start,End) :- finally_supergirl_during_8_19(Start1,End1), Start is (Start1-10), End is (End1-17), Start=<End.

globally_finally_supergirl_during_8_19_during_10_17_at_1923(Res) :- setof((Start,End),globally_finally_supergirl_during_8_19_during_10_17(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = globally_finally_supergirl_during_8_19_during_10_17_at_1923'), (globally_finally_supergirl_during_8_19_during_10_17_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).

