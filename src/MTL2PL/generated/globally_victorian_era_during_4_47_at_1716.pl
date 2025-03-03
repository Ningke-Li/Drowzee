:- include('database.pl').
victorian_era(Start,End) :- begin('victorian_era',_,_,Start), end('victorian_era',_,_,End), Start=<End.

globally_victorian_era_during_4_47(Start,End) :- victorian_era(Start1,End1), Start is (Start1-4), End is (End1-47), Start=<End.

globally_victorian_era_during_4_47_at_1716(Res) :- setof((Start,End),globally_victorian_era_during_4_47(Start,End),AllINtervals), checkvalidity(1716,AllINtervals,Res).

check_query() :- write('Query = globally_victorian_era_during_4_47_at_1716'), (globally_victorian_era_during_4_47_at_1716(true) -> write('\nRes   = true');write('\nRes   = false')).

