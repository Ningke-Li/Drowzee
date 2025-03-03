:- include('database.pl').
arrow(Start,End) :- begin('arrow',_,_,Start), end('arrow',_,_,End), Start=<End.

globally_arrow_during_2_6(Start,End) :- arrow(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

globally_arrow_during_2_6_at_2013(Res) :- setof((Start,End),globally_arrow_during_2_6(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = globally_arrow_during_2_6_at_2013'), (globally_arrow_during_2_6_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

