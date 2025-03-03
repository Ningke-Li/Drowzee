:- include('database.pl').
lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

jane_the_virgin(Start,End) :- begin('jane_the_virgin',_,_,Start), end('jane_the_virgin',_,_,End), Start=<End.

lithuanian_litas_last_till_15_19(Start,End) :- lithuanian_litas(Start1,End1), (End1-Start1)>=15, Start is (Start1+15), End is (End1+1).

lithuanian_litas_until_jane_the_virgin_during_15_19_overlap(Start,End) :- lithuanian_litas_last_till_15_19(Start1,End1), jane_the_virgin(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lithuanian_litas_until_jane_the_virgin_during_15_19(Start,End) :- lithuanian_litas(W1,_), lithuanian_litas_until_jane_the_virgin_during_15_19_overlap(Start1,End1), Start is max((Start1-19),W1), End is (End1-15), Start=<End.

lithuanian_litas_until_jane_the_virgin_during_15_19_at_1888(Res) :- setof((Start,End),lithuanian_litas_until_jane_the_virgin_during_15_19(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = lithuanian_litas_until_jane_the_virgin_during_15_19_at_1888'), (lithuanian_litas_until_jane_the_virgin_during_15_19_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

