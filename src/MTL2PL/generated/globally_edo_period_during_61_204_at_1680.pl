:- include('database.pl').
edo_period(Start,End) :- begin('edo_period',_,_,Start), end('edo_period',_,_,End), Start=<End.

globally_edo_period_during_61_204(Start,End) :- edo_period(Start1,End1), Start is (Start1-61), End is (End1-204), Start=<End.

globally_edo_period_during_61_204_at_1680(Res) :- setof((Start,End),globally_edo_period_during_61_204(Start,End),AllINtervals), checkvalidity(1680,AllINtervals,Res).

check_query() :- write('Query = globally_edo_period_during_61_204_at_1680'), (globally_edo_period_during_61_204_at_1680(true) -> write('\nRes   = true');write('\nRes   = false')).

