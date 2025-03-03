:- include('database.pl').
macedonian_front(Start,End) :- begin('macedonian_front',_,_,Start), end('macedonian_front',_,_,End), Start=<End.

globally_macedonian_front_during_2_3(Start,End) :- macedonian_front(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

next_globally_macedonian_front_during_2_3(Start,End) :- globally_macedonian_front_during_2_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_macedonian_front_during_2_3_at_1914(Res) :- setof((Start,End),next_globally_macedonian_front_during_2_3(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = next_globally_macedonian_front_during_2_3_at_1914'), (next_globally_macedonian_front_during_2_3_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).

