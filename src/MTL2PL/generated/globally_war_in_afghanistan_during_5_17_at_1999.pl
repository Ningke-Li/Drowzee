:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

globally_war_in_afghanistan_during_5_17(Start,End) :- war_in_afghanistan(Start1,End1), Start is (Start1-5), End is (End1-17), Start=<End.

globally_war_in_afghanistan_during_5_17_at_1999(Res) :- setof((Start,End),globally_war_in_afghanistan_during_5_17(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = globally_war_in_afghanistan_during_5_17_at_1999'), (globally_war_in_afghanistan_during_5_17_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

