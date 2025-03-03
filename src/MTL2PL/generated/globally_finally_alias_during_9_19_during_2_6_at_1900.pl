:- include('database.pl').
alias(Start,End) :- begin('alias',_,_,Start), end('alias',_,_,End), Start=<End.

finally_alias_during_9_19(Start,End) :- alias(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

globally_finally_alias_during_9_19_during_2_6(Start,End) :- finally_alias_during_9_19(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

globally_finally_alias_during_9_19_during_2_6_at_1900(Res) :- setof((Start,End),globally_finally_alias_during_9_19_during_2_6(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = globally_finally_alias_during_9_19_during_2_6_at_1900'), (globally_finally_alias_during_9_19_during_2_6_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

