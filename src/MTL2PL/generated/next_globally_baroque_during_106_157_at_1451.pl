:- include('database.pl').
baroque(Start,End) :- begin('baroque',_,_,Start), end('baroque',_,_,End), Start=<End.

globally_baroque_during_106_157(Start,End) :- baroque(Start1,End1), Start is (Start1-106), End is (End1-157), Start=<End.

next_globally_baroque_during_106_157(Start,End) :- globally_baroque_during_106_157(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_baroque_during_106_157_at_1451(Res) :- setof((Start,End),next_globally_baroque_during_106_157(Start,End),AllINtervals), checkvalidity(1451,AllINtervals,Res).

check_query() :- write('Query = next_globally_baroque_during_106_157_at_1451'), (next_globally_baroque_during_106_157_at_1451(true) -> write('\nRes   = true');write('\nRes   = false')).

