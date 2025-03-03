:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

globally_grimm_during_1_6(Start,End) :- grimm(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

globally_grimm_during_1_6_at_2011(Res) :- setof((Start,End),globally_grimm_during_1_6(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = globally_grimm_during_1_6_at_2011'), (globally_grimm_during_1_6_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

