:- include('database.pl').
jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

finally_jessie_during_2_14(Start,End) :- jessie(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

globally_finally_jessie_during_2_14_during_2_8(Start,End) :- finally_jessie_during_2_14(Start1,End1), Start is (Start1-2), End is (End1-8), Start=<End.

globally_finally_jessie_during_2_14_during_2_8_at_1997(Res) :- setof((Start,End),globally_finally_jessie_during_2_14_during_2_8(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = globally_finally_jessie_during_2_14_during_2_8_at_1997'), (globally_finally_jessie_during_2_14_during_2_8_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

