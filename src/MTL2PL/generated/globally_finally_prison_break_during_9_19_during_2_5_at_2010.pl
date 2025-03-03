:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

finally_prison_break_during_9_19(Start,End) :- prison_break(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

globally_finally_prison_break_during_9_19_during_2_5(Start,End) :- finally_prison_break_during_9_19(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

globally_finally_prison_break_during_9_19_during_2_5_at_2010(Res) :- setof((Start,End),globally_finally_prison_break_during_9_19_during_2_5(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = globally_finally_prison_break_during_9_19_during_2_5_at_2010'), (globally_finally_prison_break_during_9_19_during_2_5_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

