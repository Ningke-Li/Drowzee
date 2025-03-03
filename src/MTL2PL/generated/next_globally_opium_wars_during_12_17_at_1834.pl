:- include('database.pl').
opium_wars(Start,End) :- begin('opium_wars',_,_,Start), end('opium_wars',_,_,End), Start=<End.

globally_opium_wars_during_12_17(Start,End) :- opium_wars(Start1,End1), Start is (Start1-12), End is (End1-17), Start=<End.

next_globally_opium_wars_during_12_17(Start,End) :- globally_opium_wars_during_12_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_opium_wars_during_12_17_at_1834(Res) :- setof((Start,End),next_globally_opium_wars_during_12_17(Start,End),AllINtervals), checkvalidity(1834,AllINtervals,Res).

check_query() :- write('Query = next_globally_opium_wars_during_12_17_at_1834'), (next_globally_opium_wars_during_12_17_at_1834(true) -> write('\nRes   = true');write('\nRes   = false')).

