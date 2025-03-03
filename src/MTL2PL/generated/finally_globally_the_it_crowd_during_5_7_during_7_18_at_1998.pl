:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

globally_the_it_crowd_during_5_7(Start,End) :- the_it_crowd(Start1,End1), Start is (Start1-5), End is (End1-7), Start=<End.

finally_globally_the_it_crowd_during_5_7_during_7_18(Start,End) :- globally_the_it_crowd_during_5_7(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

finally_globally_the_it_crowd_during_5_7_during_7_18_at_1998(Res) :- setof((Start,End),finally_globally_the_it_crowd_during_5_7_during_7_18(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = finally_globally_the_it_crowd_during_5_7_during_7_18_at_1998'), (finally_globally_the_it_crowd_during_5_7_during_7_18_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

