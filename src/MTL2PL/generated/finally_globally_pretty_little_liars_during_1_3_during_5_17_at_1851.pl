:- include('database.pl').
pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

globally_pretty_little_liars_during_1_3(Start,End) :- pretty_little_liars(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_pretty_little_liars_during_1_3_during_5_17(Start,End) :- globally_pretty_little_liars_during_1_3(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_globally_pretty_little_liars_during_1_3_during_5_17_at_1851(Res) :- setof((Start,End),finally_globally_pretty_little_liars_during_1_3_during_5_17(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = finally_globally_pretty_little_liars_during_1_3_during_5_17_at_1851'), (finally_globally_pretty_little_liars_during_1_3_during_5_17_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).

