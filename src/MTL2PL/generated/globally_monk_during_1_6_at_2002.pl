:- include('database.pl').
monk(Start,End) :- begin('monk',_,_,Start), end('monk',_,_,End), Start=<End.

globally_monk_during_1_6(Start,End) :- monk(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

globally_monk_during_1_6_at_2002(Res) :- setof((Start,End),globally_monk_during_1_6(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = globally_monk_during_1_6_at_2002'), (globally_monk_during_1_6_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

