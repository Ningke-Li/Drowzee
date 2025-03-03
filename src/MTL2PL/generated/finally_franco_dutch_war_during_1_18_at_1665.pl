:- include('database.pl').
franco_dutch_war(Start,End) :- begin('franco_dutch_war',_,_,Start), end('franco_dutch_war',_,_,End), Start=<End.

finally_franco_dutch_war_during_1_18(Start,End) :- franco_dutch_war(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_franco_dutch_war_during_1_18_at_1665(Res) :- setof((Start,End),finally_franco_dutch_war_during_1_18(Start,End),AllINtervals), checkvalidity(1665,AllINtervals,Res).

check_query() :- write('Query = finally_franco_dutch_war_during_1_18_at_1665'), (finally_franco_dutch_war_during_1_18_at_1665(true) -> write('\nRes   = true');write('\nRes   = false')).

