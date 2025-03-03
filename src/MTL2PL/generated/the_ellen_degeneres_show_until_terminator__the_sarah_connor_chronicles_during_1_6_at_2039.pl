:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

terminator__the_sarah_connor_chronicles(Start,End) :- begin('terminator__the_sarah_connor_chronicles',_,_,Start), end('terminator__the_sarah_connor_chronicles',_,_,End), Start=<End.

the_ellen_degeneres_show_last_till_1_6(Start,End) :- the_ellen_degeneres_show(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6_overlap(Start,End) :- the_ellen_degeneres_show_last_till_1_6(Start1,End1), terminator__the_sarah_connor_chronicles(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6(Start,End) :- the_ellen_degeneres_show(W1,_), the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6_at_2039(Res) :- setof((Start,End),the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6(Start,End),AllINtervals), checkvalidity(2039,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6_at_2039'), (the_ellen_degeneres_show_until_terminator__the_sarah_connor_chronicles_during_1_6_at_2039(true) -> write('\nRes   = true');write('\nRes   = false')).

