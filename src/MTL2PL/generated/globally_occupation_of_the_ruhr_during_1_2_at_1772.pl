:- include('database.pl').
occupation_of_the_ruhr(Start,End) :- begin('occupation_of_the_ruhr',_,_,Start), end('occupation_of_the_ruhr',_,_,End), Start=<End.

globally_occupation_of_the_ruhr_during_1_2(Start,End) :- occupation_of_the_ruhr(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_occupation_of_the_ruhr_during_1_2_at_1772(Res) :- setof((Start,End),globally_occupation_of_the_ruhr_during_1_2(Start,End),AllINtervals), checkvalidity(1772,AllINtervals,Res).

check_query() :- write('Query = globally_occupation_of_the_ruhr_during_1_2_at_1772'), (globally_occupation_of_the_ruhr_during_1_2_at_1772(true) -> write('\nRes   = true');write('\nRes   = false')).

