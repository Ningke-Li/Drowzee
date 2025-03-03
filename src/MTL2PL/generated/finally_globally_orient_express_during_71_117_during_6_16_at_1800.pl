:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

globally_orient_express_during_71_117(Start,End) :- orient_express(Start1,End1), Start is (Start1-71), End is (End1-117), Start=<End.

finally_globally_orient_express_during_71_117_during_6_16(Start,End) :- globally_orient_express_during_71_117(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

finally_globally_orient_express_during_71_117_during_6_16_at_1800(Res) :- setof((Start,End),finally_globally_orient_express_during_71_117_during_6_16(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = finally_globally_orient_express_during_71_117_during_6_16_at_1800'), (finally_globally_orient_express_during_71_117_during_6_16_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).

