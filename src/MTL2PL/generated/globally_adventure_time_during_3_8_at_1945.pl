:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

globally_adventure_time_during_3_8(Start,End) :- adventure_time(Start1,End1), Start is (Start1-3), End is (End1-8), Start=<End.

globally_adventure_time_during_3_8_at_1945(Res) :- setof((Start,End),globally_adventure_time_during_3_8(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = globally_adventure_time_during_3_8_at_1945'), (globally_adventure_time_during_3_8_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).

