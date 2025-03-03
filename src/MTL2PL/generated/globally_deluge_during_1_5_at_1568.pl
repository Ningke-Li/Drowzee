:- include('database.pl').
deluge(Start,End) :- begin('deluge',_,_,Start), end('deluge',_,_,End), Start=<End.

globally_deluge_during_1_5(Start,End) :- deluge(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_deluge_during_1_5_at_1568(Res) :- setof((Start,End),globally_deluge_during_1_5(Start,End),AllINtervals), checkvalidity(1568,AllINtervals,Res).

check_query() :- write('Query = globally_deluge_during_1_5_at_1568'), (globally_deluge_during_1_5_at_1568(true) -> write('\nRes   = true');write('\nRes   = false')).

