:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

the_mentalist_last_till_2_6(Start,End) :- the_mentalist(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_mentalist_until_sofia_the_first_during_2_6_overlap(Start,End) :- the_mentalist_last_till_2_6(Start1,End1), sofia_the_first(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_mentalist_until_sofia_the_first_during_2_6(Start,End) :- the_mentalist(W1,_), the_mentalist_until_sofia_the_first_during_2_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-2), Start=<End.

the_mentalist_until_sofia_the_first_during_2_6_at_1997(Res) :- setof((Start,End),the_mentalist_until_sofia_the_first_during_2_6(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_until_sofia_the_first_during_2_6_at_1997'), (the_mentalist_until_sofia_the_first_during_2_6_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

