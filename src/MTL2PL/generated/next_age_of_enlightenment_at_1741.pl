:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

next_age_of_enlightenment(Start,End) :- age_of_enlightenment(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_age_of_enlightenment_at_1741(Res) :- setof((Start,End),next_age_of_enlightenment(Start,End),AllINtervals), checkvalidity(1741,AllINtervals,Res).

check_query() :- write('Query = next_age_of_enlightenment_at_1741'), (next_age_of_enlightenment_at_1741(true) -> write('\nRes   = true');write('\nRes   = false')).

