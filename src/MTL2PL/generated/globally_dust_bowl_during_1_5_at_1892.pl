:- include('database.pl').
dust_bowl(Start,End) :- begin('dust_bowl',_,_,Start), end('dust_bowl',_,_,End), Start=<End.

globally_dust_bowl_during_1_5(Start,End) :- dust_bowl(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_dust_bowl_during_1_5_at_1892(Res) :- setof((Start,End),globally_dust_bowl_during_1_5(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = globally_dust_bowl_during_1_5_at_1892'), (globally_dust_bowl_during_1_5_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

