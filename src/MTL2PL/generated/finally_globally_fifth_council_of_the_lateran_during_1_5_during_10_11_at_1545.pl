:- include('database.pl').
fifth_council_of_the_lateran(Start,End) :- begin('fifth_council_of_the_lateran',_,_,Start), end('fifth_council_of_the_lateran',_,_,End), Start=<End.

globally_fifth_council_of_the_lateran_during_1_5(Start,End) :- fifth_council_of_the_lateran(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

finally_globally_fifth_council_of_the_lateran_during_1_5_during_10_11(Start,End) :- globally_fifth_council_of_the_lateran_during_1_5(Start1,End1), (Start1-11)=<(End1-10), Start is (Start1-11), End is (End1-10), Start=<End.

finally_globally_fifth_council_of_the_lateran_during_1_5_during_10_11_at_1545(Res) :- setof((Start,End),finally_globally_fifth_council_of_the_lateran_during_1_5_during_10_11(Start,End),AllINtervals), checkvalidity(1545,AllINtervals,Res).

check_query() :- write('Query = finally_globally_fifth_council_of_the_lateran_during_1_5_during_10_11_at_1545'), (finally_globally_fifth_council_of_the_lateran_during_1_5_during_10_11_at_1545(true) -> write('\nRes   = true');write('\nRes   = false')).

