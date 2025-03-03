:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

finally_the_good_wife_during_9_18(Start,End) :- the_good_wife(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_the_good_wife_during_9_18_at_2021(Res) :- setof((Start,End),finally_the_good_wife_during_9_18(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = finally_the_good_wife_during_9_18_at_2021'), (finally_the_good_wife_during_9_18_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).

