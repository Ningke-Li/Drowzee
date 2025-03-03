:- include('database.pl').
the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

globally_the_office_during_1_2(Start,End) :- the_office(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_the_office_during_1_2_at_2001(Res) :- setof((Start,End),globally_the_office_during_1_2(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = globally_the_office_during_1_2_at_2001'), (globally_the_office_during_1_2_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

