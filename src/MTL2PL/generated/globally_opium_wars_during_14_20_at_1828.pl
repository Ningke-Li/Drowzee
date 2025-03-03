:- include('database.pl').
opium_wars(Start,End) :- begin('opium_wars',_,_,Start), end('opium_wars',_,_,End), Start=<End.

globally_opium_wars_during_14_20(Start,End) :- opium_wars(Start1,End1), Start is (Start1-14), End is (End1-20), Start=<End.

globally_opium_wars_during_14_20_at_1828(Res) :- setof((Start,End),globally_opium_wars_during_14_20(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = globally_opium_wars_during_14_20_at_1828'), (globally_opium_wars_during_14_20_at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).

