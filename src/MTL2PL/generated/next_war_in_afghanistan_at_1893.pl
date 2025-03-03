:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

next_war_in_afghanistan(Start,End) :- war_in_afghanistan(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_war_in_afghanistan_at_1893(Res) :- setof((Start,End),next_war_in_afghanistan(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_war_in_afghanistan_at_1893'), (next_war_in_afghanistan_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

