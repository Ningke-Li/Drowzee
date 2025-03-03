:- include('database.pl').
stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

globally_stargate_atlantis_during_1_4(Start,End) :- stargate_atlantis(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_stargate_atlantis_during_1_4_at_2004(Res) :- setof((Start,End),globally_stargate_atlantis_during_1_4(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = globally_stargate_atlantis_during_1_4_at_2004'), (globally_stargate_atlantis_during_1_4_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

