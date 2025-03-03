:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

globally_ncis__new_orleans_during_1_4(Start,End) :- ncis__new_orleans(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

finally_globally_ncis__new_orleans_during_1_4_during_10_16(Start,End) :- globally_ncis__new_orleans_during_1_4(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_globally_ncis__new_orleans_during_1_4_during_10_16_at_1967(Res) :- setof((Start,End),finally_globally_ncis__new_orleans_during_1_4_during_10_16(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ncis__new_orleans_during_1_4_during_10_16_at_1967'), (finally_globally_ncis__new_orleans_during_1_4_during_10_16_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).

