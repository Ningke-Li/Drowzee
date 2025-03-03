:- include('database.pl').
congress_of_vienna(Start,End) :- begin('congress_of_vienna',_,_,Start), end('congress_of_vienna',_,_,End), Start=<End.

finally_congress_of_vienna_during_3_13(Start,End) :- congress_of_vienna(Start1,End1), (Start1-13)=<(End1-3), Start is (Start1-13), End is (End1-3), Start=<End.

finally_congress_of_vienna_during_3_13_at_1811(Res) :- setof((Start,End),finally_congress_of_vienna_during_3_13(Start,End),AllINtervals), checkvalidity(1811,AllINtervals,Res).

check_query() :- write('Query = finally_congress_of_vienna_during_3_13_at_1811'), (finally_congress_of_vienna_during_3_13_at_1811(true) -> write('\nRes   = true');write('\nRes   = false')).

