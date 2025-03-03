:- include('database.pl').
hannah_montana(Start,End) :- begin('hannah_montana',_,_,Start), end('hannah_montana',_,_,End), Start=<End.

globally_hannah_montana_during_1_2(Start,End) :- hannah_montana(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

finally_globally_hannah_montana_during_1_2_during_9_19(Start,End) :- globally_hannah_montana_during_1_2(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

finally_globally_hannah_montana_during_1_2_during_9_19_at_1982(Res) :- setof((Start,End),finally_globally_hannah_montana_during_1_2_during_9_19(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = finally_globally_hannah_montana_during_1_2_during_9_19_at_1982'), (finally_globally_hannah_montana_during_1_2_during_9_19_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).

