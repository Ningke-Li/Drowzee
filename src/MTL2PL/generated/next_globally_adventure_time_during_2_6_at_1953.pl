:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

globally_adventure_time_during_2_6(Start,End) :- adventure_time(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

next_globally_adventure_time_during_2_6(Start,End) :- globally_adventure_time_during_2_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_adventure_time_during_2_6_at_1953(Res) :- setof((Start,End),next_globally_adventure_time_during_2_6(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = next_globally_adventure_time_during_2_6_at_1953'), (next_globally_adventure_time_during_2_6_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).

