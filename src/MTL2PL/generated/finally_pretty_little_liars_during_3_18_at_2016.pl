:- include('database.pl').
pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

finally_pretty_little_liars_during_3_18(Start,End) :- pretty_little_liars(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_pretty_little_liars_during_3_18_at_2016(Res) :- setof((Start,End),finally_pretty_little_liars_during_3_18(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = finally_pretty_little_liars_during_3_18_at_2016'), (finally_pretty_little_liars_during_3_18_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

