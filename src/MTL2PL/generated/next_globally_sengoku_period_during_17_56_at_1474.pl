:- include('database.pl').
sengoku_period(Start,End) :- begin('sengoku_period',_,_,Start), end('sengoku_period',_,_,End), Start=<End.

globally_sengoku_period_during_17_56(Start,End) :- sengoku_period(Start1,End1), Start is (Start1-17), End is (End1-56), Start=<End.

next_globally_sengoku_period_during_17_56(Start,End) :- globally_sengoku_period_during_17_56(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_sengoku_period_during_17_56_at_1474(Res) :- setof((Start,End),next_globally_sengoku_period_during_17_56(Start,End),AllINtervals), checkvalidity(1474,AllINtervals,Res).

check_query() :- write('Query = next_globally_sengoku_period_during_17_56_at_1474'), (next_globally_sengoku_period_during_17_56_at_1474(true) -> write('\nRes   = true');write('\nRes   = false')).

