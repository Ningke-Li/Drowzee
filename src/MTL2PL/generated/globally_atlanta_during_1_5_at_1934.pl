:- include('database.pl').
atlanta(Start,End) :- begin('atlanta',_,_,Start), end('atlanta',_,_,End), Start=<End.

globally_atlanta_during_1_5(Start,End) :- atlanta(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_atlanta_during_1_5_at_1934(Res) :- setof((Start,End),globally_atlanta_during_1_5(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = globally_atlanta_during_1_5_at_1934'), (globally_atlanta_during_1_5_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

