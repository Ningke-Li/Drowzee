:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

globally_mad_men_during_6_7(Start,End) :- mad_men(Start1,End1), Start is (Start1-6), End is (End1-7), Start=<End.

globally_mad_men_during_6_7_at_1918(Res) :- setof((Start,End),globally_mad_men_during_6_7(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = globally_mad_men_during_6_7_at_1918'), (globally_mad_men_during_6_7_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

