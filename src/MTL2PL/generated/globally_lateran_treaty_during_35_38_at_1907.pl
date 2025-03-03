:- include('database.pl').
lateran_treaty(Start,End) :- begin('lateran_treaty',_,_,Start), end('lateran_treaty',_,_,End), Start=<End.

globally_lateran_treaty_during_35_38(Start,End) :- lateran_treaty(Start1,End1), Start is (Start1-35), End is (End1-38), Start=<End.

globally_lateran_treaty_during_35_38_at_1907(Res) :- setof((Start,End),globally_lateran_treaty_during_35_38(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = globally_lateran_treaty_during_35_38_at_1907'), (globally_lateran_treaty_during_35_38_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).

