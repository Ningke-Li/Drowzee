:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

globally_shameless_during_1_10(Start,End) :- shameless(Start1,End1), Start is (Start1-1), End is (End1-10), Start=<End.

globally_shameless_during_1_10_at_2011(Res) :- setof((Start,End),globally_shameless_during_1_10(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = globally_shameless_during_1_10_at_2011'), (globally_shameless_during_1_10_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

