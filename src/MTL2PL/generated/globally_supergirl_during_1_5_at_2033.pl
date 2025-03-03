:- include('database.pl').
supergirl(Start,End) :- begin('supergirl',_,_,Start), end('supergirl',_,_,End), Start=<End.

globally_supergirl_during_1_5(Start,End) :- supergirl(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_supergirl_during_1_5_at_2033(Res) :- setof((Start,End),globally_supergirl_during_1_5(Start,End),AllINtervals), checkvalidity(2033,AllINtervals,Res).

check_query() :- write('Query = globally_supergirl_during_1_5_at_2033'), (globally_supergirl_during_1_5_at_2033(true) -> write('\nRes   = true');write('\nRes   = false')).

