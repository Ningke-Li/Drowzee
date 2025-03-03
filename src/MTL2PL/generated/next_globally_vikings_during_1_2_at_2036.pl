:- include('database.pl').
vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

globally_vikings_during_1_2(Start,End) :- vikings(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

next_globally_vikings_during_1_2(Start,End) :- globally_vikings_during_1_2(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_vikings_during_1_2_at_2036(Res) :- setof((Start,End),next_globally_vikings_during_1_2(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = next_globally_vikings_during_1_2_at_2036'), (next_globally_vikings_during_1_2_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).

