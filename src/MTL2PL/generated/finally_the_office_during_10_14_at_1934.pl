:- include('database.pl').
the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

finally_the_office_during_10_14(Start,End) :- the_office(Start1,End1), (Start1-14)=<(End1-10), Start is (Start1-14), End is (End1-10), Start=<End.

finally_the_office_during_10_14_at_1934(Res) :- setof((Start,End),finally_the_office_during_10_14(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = finally_the_office_during_10_14_at_1934'), (finally_the_office_during_10_14_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

