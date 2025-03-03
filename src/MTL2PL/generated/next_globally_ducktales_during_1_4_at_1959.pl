:- include('database.pl').
ducktales(Start,End) :- begin('ducktales',_,_,Start), end('ducktales',_,_,End), Start=<End.

globally_ducktales_during_1_4(Start,End) :- ducktales(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

next_globally_ducktales_during_1_4(Start,End) :- globally_ducktales_during_1_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ducktales_during_1_4_at_1959(Res) :- setof((Start,End),next_globally_ducktales_during_1_4(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = next_globally_ducktales_during_1_4_at_1959'), (next_globally_ducktales_during_1_4_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

