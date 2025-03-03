:- include('database.pl').
jewish_exodus_from_the_muslim_world(Start,End) :- begin('jewish_exodus_from_the_muslim_world',_,_,Start), end('jewish_exodus_from_the_muslim_world',_,_,End), Start=<End.

globally_jewish_exodus_from_the_muslim_world_during_11_28(Start,End) :- jewish_exodus_from_the_muslim_world(Start1,End1), Start is (Start1-11), End is (End1-28), Start=<End.

globally_jewish_exodus_from_the_muslim_world_during_11_28_at_1982(Res) :- setof((Start,End),globally_jewish_exodus_from_the_muslim_world_during_11_28(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = globally_jewish_exodus_from_the_muslim_world_during_11_28_at_1982'), (globally_jewish_exodus_from_the_muslim_world_during_11_28_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).

