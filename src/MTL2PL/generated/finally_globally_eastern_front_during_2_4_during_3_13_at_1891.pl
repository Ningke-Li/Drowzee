:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

globally_eastern_front_during_2_4(Start,End) :- eastern_front(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

finally_globally_eastern_front_during_2_4_during_3_13(Start,End) :- globally_eastern_front_during_2_4(Start1,End1), (Start1-13)=<(End1-3), Start is (Start1-13), End is (End1-3), Start=<End.

finally_globally_eastern_front_during_2_4_during_3_13_at_1891(Res) :- setof((Start,End),finally_globally_eastern_front_during_2_4_during_3_13(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = finally_globally_eastern_front_during_2_4_during_3_13_at_1891'), (finally_globally_eastern_front_during_2_4_during_3_13_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

