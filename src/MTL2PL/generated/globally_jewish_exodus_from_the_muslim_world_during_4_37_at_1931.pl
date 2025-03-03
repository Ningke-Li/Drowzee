:- include('database.pl').
jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

globally_jewish_exodus_from_the_muslim_world_during_4_37(Start,End) :- jewish_exodus_from_the_muslim_world(Start1,End1), Start is (Start1-4), End is (End1-37), Start=<End.

globally_jewish_exodus_from_the_muslim_world_during_4_37_at_1931(Res) :- setof((Start,End),globally_jewish_exodus_from_the_muslim_world_during_4_37(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = globally_jewish_exodus_from_the_muslim_world_during_4_37_at_1931'), (globally_jewish_exodus_from_the_muslim_world_during_4_37_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

