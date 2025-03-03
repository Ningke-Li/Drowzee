:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

revolution_of_dignity(Start,End) :- begin('revolution_of_dignity',_,_,Start), end('revolution_of_dignity',_,_,End), Start=<End.

mad_men_last_till_4_11(Start,End) :- mad_men(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

mad_men_until_revolution_of_dignity_during_4_11_overlap(Start,End) :- mad_men_last_till_4_11(Start1,End1), revolution_of_dignity(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mad_men_until_revolution_of_dignity_during_4_11(Start,End) :- mad_men(W1,_), mad_men_until_revolution_of_dignity_during_4_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-4), Start=<End.

mad_men_until_revolution_of_dignity_during_4_11_at_1927(Res) :- setof((Start,End),mad_men_until_revolution_of_dignity_during_4_11(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = mad_men_until_revolution_of_dignity_during_4_11_at_1927'), (mad_men_until_revolution_of_dignity_during_4_11_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

