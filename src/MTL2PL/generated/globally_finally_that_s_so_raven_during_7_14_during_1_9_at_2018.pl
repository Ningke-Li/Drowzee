:- include('database.pl').
that_s_so_raven(Start,End) :- begin('that_s_so_raven',_,_,Start), end('that_s_so_raven',_,_,End), Start=<End.

finally_that_s_so_raven_during_7_14(Start,End) :- that_s_so_raven(Start1,End1), (Start1-14)=<(End1-7), Start is (Start1-14), End is (End1-7), Start=<End.

globally_finally_that_s_so_raven_during_7_14_during_1_9(Start,End) :- finally_that_s_so_raven_during_7_14(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

globally_finally_that_s_so_raven_during_7_14_during_1_9_at_2018(Res) :- setof((Start,End),globally_finally_that_s_so_raven_during_7_14_during_1_9(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = globally_finally_that_s_so_raven_during_7_14_during_1_9_at_2018'), (globally_finally_that_s_so_raven_during_7_14_during_1_9_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).

