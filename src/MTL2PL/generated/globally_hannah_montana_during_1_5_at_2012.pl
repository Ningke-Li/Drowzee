:- include('database.pl').
hannah_montana(Start,End) :- begin('hannah_montana',_,_,Start), end('hannah_montana',_,_,End), Start=<End.

globally_hannah_montana_during_1_5(Start,End) :- hannah_montana(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_hannah_montana_during_1_5_at_2012(Res) :- setof((Start,End),globally_hannah_montana_during_1_5(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = globally_hannah_montana_during_1_5_at_2012'), (globally_hannah_montana_during_1_5_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

