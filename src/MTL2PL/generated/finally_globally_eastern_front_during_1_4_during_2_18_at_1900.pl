:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

globally_eastern_front_during_1_4(Start,End) :- eastern_front(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_eastern_front_during_1_4_during_2_18(Start,End) :- globally_eastern_front_during_1_4(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

finally_globally_eastern_front_during_1_4_during_2_18_at_1900(Res) :- setof((Start,End),finally_globally_eastern_front_during_1_4_during_2_18(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = finally_globally_eastern_front_during_1_4_during_2_18_at_1900'), (finally_globally_eastern_front_during_1_4_during_2_18_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

