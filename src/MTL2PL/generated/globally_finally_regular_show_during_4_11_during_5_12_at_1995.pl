:- include('database.pl').
regular_show(Start,End) :- begin('regular_show',_,_,Start), end('regular_show',_,_,End), Start=<End.

finally_regular_show_during_4_11(Start,End) :- regular_show(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

globally_finally_regular_show_during_4_11_during_5_12(Start,End) :- finally_regular_show_during_4_11(Start1,End1), Start is (Start1-5), End is (End1-12), Start=<End.

globally_finally_regular_show_during_4_11_during_5_12_at_1995(Res) :- setof((Start,End),globally_finally_regular_show_during_4_11_during_5_12(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = globally_finally_regular_show_during_4_11_during_5_12_at_1995'), (globally_finally_regular_show_during_4_11_during_5_12_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

