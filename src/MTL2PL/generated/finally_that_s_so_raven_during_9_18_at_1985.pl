:- include('database.pl').
that_s_so_raven(Start,End) :- begin('that_s_so_raven',_,_,Start), end('that_s_so_raven',_,_,End), Start=<End.

finally_that_s_so_raven_during_9_18(Start,End) :- that_s_so_raven(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_that_s_so_raven_during_9_18_at_1985(Res) :- setof((Start,End),finally_that_s_so_raven_during_9_18(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = finally_that_s_so_raven_during_9_18_at_1985'), (finally_that_s_so_raven_during_9_18_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

