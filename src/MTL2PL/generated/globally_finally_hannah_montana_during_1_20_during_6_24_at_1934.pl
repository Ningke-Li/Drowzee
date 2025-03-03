:- include('database.pl').
hannah_montana(Start,End) :- begin('hannah_montana',_,_,Start), end('hannah_montana',_,_,End), Start=<End.

finally_hannah_montana_during_1_20(Start,End) :- hannah_montana(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

globally_finally_hannah_montana_during_1_20_during_6_24(Start,End) :- finally_hannah_montana_during_1_20(Start1,End1), Start is (Start1-6), End is (End1-24), Start=<End.

globally_finally_hannah_montana_during_1_20_during_6_24_at_1934(Res) :- setof((Start,End),globally_finally_hannah_montana_during_1_20_during_6_24(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = globally_finally_hannah_montana_during_1_20_during_6_24_at_1934'), (globally_finally_hannah_montana_during_1_20_during_6_24_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

