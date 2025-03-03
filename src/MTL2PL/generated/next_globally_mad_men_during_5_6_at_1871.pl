:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

globally_mad_men_during_5_6(Start,End) :- mad_men(Start1,End1), Start is (Start1-5), End is (End1-6), Start=<End.

next_globally_mad_men_during_5_6(Start,End) :- globally_mad_men_during_5_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_mad_men_during_5_6_at_1871(Res) :- setof((Start,End),next_globally_mad_men_during_5_6(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = next_globally_mad_men_during_5_6_at_1871'), (next_globally_mad_men_during_5_6_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

