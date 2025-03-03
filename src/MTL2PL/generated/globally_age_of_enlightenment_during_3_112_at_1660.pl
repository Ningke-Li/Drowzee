:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

globally_age_of_enlightenment_during_3_112(Start,End) :- age_of_enlightenment(Start1,End1), Start is (Start1-3), End is (End1-112), Start=<End.

globally_age_of_enlightenment_during_3_112_at_1660(Res) :- setof((Start,End),globally_age_of_enlightenment_during_3_112(Start,End),AllINtervals), checkvalidity(1660,AllINtervals,Res).

check_query() :- write('Query = globally_age_of_enlightenment_during_3_112_at_1660'), (globally_age_of_enlightenment_during_3_112_at_1660(true) -> write('\nRes   = true');write('\nRes   = false')).

