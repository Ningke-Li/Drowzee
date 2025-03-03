:- include('database.pl').
vienna_offensive(Start,End) :- begin('vienna_offensive',_,_,Start), end('vienna_offensive',_,_,End), Start=<End.

finally_vienna_offensive_during_5_19(Start,End) :- vienna_offensive(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_vienna_offensive_during_5_19_at_1933(Res) :- setof((Start,End),finally_vienna_offensive_during_5_19(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = finally_vienna_offensive_during_5_19_at_1933'), (finally_vienna_offensive_during_5_19_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).

