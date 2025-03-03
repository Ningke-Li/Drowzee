:- include('database.pl').
meiji_period(Start,End) :- begin('meiji_period',_,_,Start), end('meiji_period',_,_,End), Start=<End.

globally_meiji_period_during_21_44(Start,End) :- meiji_period(Start1,End1), Start is (Start1-21), End is (End1-44), Start=<End.

next_globally_meiji_period_during_21_44(Start,End) :- globally_meiji_period_during_21_44(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_meiji_period_during_21_44_at_1830(Res) :- setof((Start,End),next_globally_meiji_period_during_21_44(Start,End),AllINtervals), checkvalidity(1830,AllINtervals,Res).

check_query() :- write('Query = next_globally_meiji_period_during_21_44_at_1830'), (next_globally_meiji_period_during_21_44_at_1830(true) -> write('\nRes   = true');write('\nRes   = false')).

