:- include('database.pl').
thirty_years__war(Start,End) :- begin('thirty_years__war',_,_,Start), end('thirty_years__war',_,_,End), Start=<End.

globally_thirty_years__war_during_11_22(Start,End) :- thirty_years__war(Start1,End1), Start is (Start1-11), End is (End1-22), Start=<End.

globally_thirty_years__war_during_11_22_at_1607(Res) :- setof((Start,End),globally_thirty_years__war_during_11_22(Start,End),AllINtervals), checkvalidity(1607,AllINtervals,Res).

check_query() :- write('Query = globally_thirty_years__war_during_11_22_at_1607'), (globally_thirty_years__war_during_11_22_at_1607(true) -> write('\nRes   = true');write('\nRes   = false')).

