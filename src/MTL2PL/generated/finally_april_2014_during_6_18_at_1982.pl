:- include('database.pl').
april_2014(Start,End) :- begin('april_2014',_,_,Start), end('april_2014',_,_,End), Start=<End.

finally_april_2014_during_6_18(Start,End) :- april_2014(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_april_2014_during_6_18_at_1982(Res) :- setof((Start,End),finally_april_2014_during_6_18(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = finally_april_2014_during_6_18_at_1982'), (finally_april_2014_during_6_18_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).

