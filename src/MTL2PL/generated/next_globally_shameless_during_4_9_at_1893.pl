:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

globally_shameless_during_4_9(Start,End) :- shameless(Start1,End1), Start is (Start1-4), End is (End1-9), Start=<End.

next_globally_shameless_during_4_9(Start,End) :- globally_shameless_during_4_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_shameless_during_4_9_at_1893(Res) :- setof((Start,End),next_globally_shameless_during_4_9(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_globally_shameless_during_4_9_at_1893'), (next_globally_shameless_during_4_9_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

