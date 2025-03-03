:- include('database.pl').
eastern_front(Start,End) :- begin('eastern_front',_,_,Start), end('eastern_front',_,_,End), Start=<End.

globally_eastern_front_during_1_3(Start,End) :- eastern_front(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_eastern_front_during_1_3(Start,End) :- globally_eastern_front_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_eastern_front_during_1_3_at_1912(Res) :- setof((Start,End),next_globally_eastern_front_during_1_3(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = next_globally_eastern_front_during_1_3_at_1912'), (next_globally_eastern_front_during_1_3_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).

