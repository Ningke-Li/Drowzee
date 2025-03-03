:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

flight_and_expulsion_of_germans__1944_1950_(Start,End) :- begin('flight_and_expulsion_of_germans__1944_1950_',_,_,Start), end('flight_and_expulsion_of_germans__1944_1950_',_,_,End), Start=<End.

orient_express_last_till_25_33(Start,End) :- orient_express(Start1,End1), (End1-Start1)>=25, Start is (Start1+25), End is (End1+1).

orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33_overlap(Start,End) :- orient_express_last_till_25_33(Start1,End1), flight_and_expulsion_of_germans__1944_1950_(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33(Start,End) :- orient_express(W1,_), orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33_overlap(Start1,End1), Start is max((Start1-33),W1), End is (End1-25), Start=<End.

orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33_at_1915(Res) :- setof((Start,End),orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33_at_1915'), (orient_express_until_flight_and_expulsion_of_germans__1944_1950__during_25_33_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

