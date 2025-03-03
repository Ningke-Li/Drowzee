:- include('database.pl').
the_borgias(Start,End) :- begin('the_borgias',_,_,Start), end('the_borgias',_,_,End), Start=<End.

globally_the_borgias_during_1_2(Start,End) :- the_borgias(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_the_borgias_during_1_2_at_2010(Res) :- setof((Start,End),globally_the_borgias_during_1_2(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = globally_the_borgias_during_1_2_at_2010'), (globally_the_borgias_during_1_2_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

