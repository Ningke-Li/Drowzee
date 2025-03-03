:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

globally_ncis__new_orleans_during_2_7(Start,End) :- ncis__new_orleans(Start1,End1), Start is (Start1-2), End is (End1-7), Start=<End.

finally_globally_ncis__new_orleans_during_2_7_during_9_18(Start,End) :- globally_ncis__new_orleans_during_2_7(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_globally_ncis__new_orleans_during_2_7_during_9_18_at_2001(Res) :- setof((Start,End),finally_globally_ncis__new_orleans_during_2_7_during_9_18(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ncis__new_orleans_during_2_7_during_9_18_at_2001'), (finally_globally_ncis__new_orleans_during_2_7_during_9_18_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

