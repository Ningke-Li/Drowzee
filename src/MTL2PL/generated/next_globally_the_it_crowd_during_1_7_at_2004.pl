:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

globally_the_it_crowd_during_1_7(Start,End) :- the_it_crowd(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

next_globally_the_it_crowd_during_1_7(Start,End) :- globally_the_it_crowd_during_1_7(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_the_it_crowd_during_1_7_at_2004(Res) :- setof((Start,End),next_globally_the_it_crowd_during_1_7(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = next_globally_the_it_crowd_during_1_7_at_2004'), (next_globally_the_it_crowd_during_1_7_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

