:- include('database.pl').
rococo(Start,End) :- begin('rococo',_,_,Start), end('rococo',_,_,End), Start=<End.

finally_rococo_during_6_19(Start,End) :- rococo(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

globally_finally_rococo_during_6_19_during_11_59(Start,End) :- finally_rococo_during_6_19(Start1,End1), Start is (Start1-11), End is (End1-59), Start=<End.

globally_finally_rococo_during_6_19_during_11_59_at_1712(Res) :- setof((Start,End),globally_finally_rococo_during_6_19_during_11_59(Start,End),AllINtervals), checkvalidity(1712,AllINtervals,Res).

check_query() :- write('Query = globally_finally_rococo_during_6_19_during_11_59_at_1712'), (globally_finally_rococo_during_6_19_during_11_59_at_1712(true) -> write('\nRes   = true');write('\nRes   = false')).

