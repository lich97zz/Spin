	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM prop3 */
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 10: // STATE 15
		goto R999;
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 19: // STATE 83
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM prop2 */
;
		;
		;
		;
		
	case 22: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM prop1 */
;
		
	case 23: // STATE 1
		goto R999;

	case 24: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC mutex */

	case 25: // STATE 2
		;
		((P0 *)_this)->j = trpt->bup.ovals[1];
		((P0 *)_this)->i = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 26: // STATE 3
		;
		now.flag[ Index(((P0 *)_this)->i, 2) ] = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 4
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 29: // STATE 6
		;
		now.ncrit = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 31: // STATE 8
		;
		now.ncrit = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 9
		;
		now.flag[ Index(((P0 *)_this)->i, 2) ] = trpt->bup.oval;
		;
		goto R999;
	}

