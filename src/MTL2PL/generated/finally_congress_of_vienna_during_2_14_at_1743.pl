:- include('database.pl').
congress_of_vienna(Start,End) :- begin('congress_of_vienna',_,_,Start), end('congress_of_vienna',_,_,End), Start=<End.

finally_congress_of_vienna_during_2_14(Start,End) :- congress_of_vienna(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_congress_of_vienna_during_2_14_at_1743(Res) :- setof((Start,End),finally_congress_of_vienna_during_2_14(Start,End),AllINtervals), checkvalidity(1743,AllINtervals,Res).

check_query() :- write('Query = finally_congress_of_vienna_during_2_14_at_1743'), (finally_congress_of_vienna_during_2_14_at_1743(true) -> write('\nRes   = true');write('\nRes   = false')).

