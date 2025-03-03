:- include('database.pl').
invasion_of_poland(Start,End) :- begin('invasion_of_poland',_,_,Start), end('invasion_of_poland',_,_,End), Start=<End.

finally_invasion_of_poland_during_2_15(Start,End) :- invasion_of_poland(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_invasion_of_poland_during_2_15_at_1869(Res) :- setof((Start,End),finally_invasion_of_poland_during_2_15(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = finally_invasion_of_poland_during_2_15_at_1869'), (finally_invasion_of_poland_during_2_15_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).

