:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

globally_yugoslav_dinar_during_5_71(Start,End) :- yugoslav_dinar(Start1,End1), Start is (Start1-5), End is (End1-71), Start=<End.

next_globally_yugoslav_dinar_during_5_71(Start,End) :- globally_yugoslav_dinar_during_5_71(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_yugoslav_dinar_during_5_71_at_1919(Res) :- setof((Start,End),next_globally_yugoslav_dinar_during_5_71(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = next_globally_yugoslav_dinar_during_5_71_at_1919'), (next_globally_yugoslav_dinar_during_5_71_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

