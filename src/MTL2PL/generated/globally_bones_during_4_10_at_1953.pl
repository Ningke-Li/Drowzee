:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

globally_bones_during_4_10(Start,End) :- bones(Start1,End1), Start is (Start1-4), End is (End1-10), Start=<End.

globally_bones_during_4_10_at_1953(Res) :- setof((Start,End),globally_bones_during_4_10(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = globally_bones_during_4_10_at_1953'), (globally_bones_during_4_10_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).

