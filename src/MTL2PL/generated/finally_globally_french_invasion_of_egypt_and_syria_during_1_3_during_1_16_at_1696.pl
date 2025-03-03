:- include('database.pl').
french_invasion_of_egypt_and_syria(Start,End) :- begin('french_invasion_of_egypt_and_syria',_,_,Start), end('french_invasion_of_egypt_and_syria',_,_,End), Start=<End.

globally_french_invasion_of_egypt_and_syria_during_1_3(Start,End) :- french_invasion_of_egypt_and_syria(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_french_invasion_of_egypt_and_syria_during_1_3_during_1_16(Start,End) :- globally_french_invasion_of_egypt_and_syria_during_1_3(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_globally_french_invasion_of_egypt_and_syria_during_1_3_during_1_16_at_1696(Res) :- setof((Start,End),finally_globally_french_invasion_of_egypt_and_syria_during_1_3_during_1_16(Start,End),AllINtervals), checkvalidity(1696,AllINtervals,Res).

check_query() :- write('Query = finally_globally_french_invasion_of_egypt_and_syria_during_1_3_during_1_16_at_1696'), (finally_globally_french_invasion_of_egypt_and_syria_during_1_3_during_1_16_at_1696(true) -> write('\nRes   = true');write('\nRes   = false')).

