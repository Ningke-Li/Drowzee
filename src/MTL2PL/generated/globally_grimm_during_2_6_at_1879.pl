:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

globally_grimm_during_2_6(Start,End) :- grimm(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

globally_grimm_during_2_6_at_1879(Res) :- setof((Start,End),globally_grimm_during_2_6(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = globally_grimm_during_2_6_at_1879'), (globally_grimm_during_2_6_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).

