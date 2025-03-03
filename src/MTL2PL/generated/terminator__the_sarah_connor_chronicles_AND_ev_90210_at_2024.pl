:- include('database.pl').
terminator__the_sarah_connor_chronicles(Start,End) :- begin('terminator__the_sarah_connor_chronicles',_,_,Start), end('terminator__the_sarah_connor_chronicles',_,_,End), Start=<End.

ev_90210(Start,End) :- begin('ev_90210',_,_,Start), end('ev_90210',_,_,End), Start=<End.

generate_facts_terminator__the_sarah_connor_chronicles_AND_ev_90210([]) :- assert(terminator__the_sarah_connor_chronicles_AND_ev_90210(-1,-1)).

generate_facts_terminator__the_sarah_connor_chronicles_AND_ev_90210([(Start,End) | Tail]) :- assert(terminator__the_sarah_connor_chronicles_AND_ev_90210(Start,End)), generate_facts_terminator__the_sarah_connor_chronicles_AND_ev_90210(Tail).

terminator__the_sarah_connor_chronicles_AND_ev_90210_aux() :- findall((Start,End),terminator__the_sarah_connor_chronicles(Start,End),Interval1), findall((Start,End),ev_90210(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_terminator__the_sarah_connor_chronicles_AND_ev_90210(Interval).

terminator__the_sarah_connor_chronicles_AND_ev_90210_at_2024(Res) :- setof((Start,End),terminator__the_sarah_connor_chronicles_AND_ev_90210(Start,End),AllINtervals), checkvalidity(2024,AllINtervals,Res).

check_query() :- write('Query = terminator__the_sarah_connor_chronicles_AND_ev_90210_at_2024'), (terminator__the_sarah_connor_chronicles_AND_ev_90210_at_2024(true) -> write('\nRes   = true');write('\nRes   = false')).
?- terminator__the_sarah_connor_chronicles_AND_ev_90210_aux().

