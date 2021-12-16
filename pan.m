#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM prop3 */
	case 3: // STATE 1 - _spin_nvr.tmp:23 - [(((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(mutex[0]._p==trying))&&(mutex[1]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][1] = 1;
		if (!((( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)((P0 *)Pptr(BASE+0))->_p)==3))&&(((int)((P0 *)Pptr(BASE+1))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 3 - _spin_nvr.tmp:24 - [((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(mutex[0]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported3 = 0;
			if (verbose && !reported3)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported3 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][3] = 1;
		if (!(( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)((P0 *)Pptr(BASE+0))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 5 - _spin_nvr.tmp:25 - [(((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==1))&&(mutex[0]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported5 = 0;
			if (verbose && !reported5)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported5 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][5] = 1;
		if (!((( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)now._last)==1))&&(((int)((P0 *)Pptr(BASE+0))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 7 - _spin_nvr.tmp:26 - [(!((!((mutex[0]._p==trying))||(mutex[0]._p==critical))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported7 = 0;
			if (verbose && !reported7)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported7 = 0;
			if (verbose && !reported7)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][7] = 1;
		if (!( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 9 - _spin_nvr.tmp:27 - [((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==1)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported9 = 0;
			if (verbose && !reported9)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported9 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported9 = 0;
			if (verbose && !reported9)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported9 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][9] = 1;
		if (!(( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)now._last)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 11 - _spin_nvr.tmp:28 - [(((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==0))&&(mutex[1]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported11 = 0;
			if (verbose && !reported11)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported11 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported11 = 0;
			if (verbose && !reported11)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported11 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][11] = 1;
		if (!((( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)now._last)==0))&&(((int)((P0 *)Pptr(BASE+1))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 13 - _spin_nvr.tmp:29 - [((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==0)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][13] = 1;
		if (!(( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)now._last)==0))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 15 - _spin_nvr.tmp:30 - [(((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==0))&&(_last==1)))] (18:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported15 = 0;
			if (verbose && !reported15)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported15 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][15] = 1;
		if (!((( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)now._last)==0))&&(((int)now._last)==1))))
			continue;
		/* merge: assert(!(((!((!((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==0))&&(_last==1))))(0, 16, 18) */
		reached[3][16] = 1;
		spin_assert( !((( !(( !((((int)((P0 *)Pptr(BASE+0))->_p)==3))||(((int)((P0 *)Pptr(BASE+0))->_p)==6)))&&(((int)now._last)==0))&&(((int)now._last)==1))), " !((( !(( !((mutex[0]._p==trying))||(mutex[0]._p==critical)))&&(_last==0))&&(_last==1)))", II, tt, t);
		/* merge: .(goto)(0, 19, 18) */
		reached[3][19] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 11: // STATE 21 - _spin_nvr.tmp:34 - [(((mutex[0]._p==trying)&&(mutex[1]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported21 = 0;
			if (verbose && !reported21)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported21 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported21 = 0;
			if (verbose && !reported21)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported21 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][21] = 1;
		if (!(((((int)((P0 *)Pptr(BASE+0))->_p)==3)&&(((int)((P0 *)Pptr(BASE+1))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 45 - _spin_nvr.tmp:52 - [((mutex[1]._p==trying))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported45 = 0;
			if (verbose && !reported45)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported45 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported45 = 0;
			if (verbose && !reported45)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported45 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][45] = 1;
		if (!((((int)((P0 *)Pptr(BASE+1))->_p)==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 50 - _spin_nvr.tmp:56 - [(((mutex[0]._p==trying)&&(mutex[1]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported50 = 0;
			if (verbose && !reported50)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported50 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported50 = 0;
			if (verbose && !reported50)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported50 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][50] = 1;
		if (!(((((int)((P0 *)Pptr(BASE+0))->_p)==3)&&(((int)((P0 *)Pptr(BASE+1))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 52 - _spin_nvr.tmp:57 - [((mutex[0]._p==trying))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported52 = 0;
			if (verbose && !reported52)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported52 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported52 = 0;
			if (verbose && !reported52)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported52 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][52] = 1;
		if (!((((int)((P0 *)Pptr(BASE+0))->_p)==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 59 - _spin_nvr.tmp:62 - [((mutex[0]._p==trying))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported59 = 0;
			if (verbose && !reported59)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported59 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported59 = 0;
			if (verbose && !reported59)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported59 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][59] = 1;
		if (!((((int)((P0 *)Pptr(BASE+0))->_p)==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 61 - _spin_nvr.tmp:63 - [(((mutex[0]._p==trying)&&(mutex[1]._p==trying)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported61 = 0;
			if (verbose && !reported61)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported61 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported61 = 0;
			if (verbose && !reported61)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported61 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][61] = 1;
		if (!(((((int)((P0 *)Pptr(BASE+0))->_p)==3)&&(((int)((P0 *)Pptr(BASE+1))->_p)==3))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 68 - _spin_nvr.tmp:68 - [((mutex[0]._p==trying))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported68 = 0;
			if (verbose && !reported68)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported68 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported68 = 0;
			if (verbose && !reported68)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported68 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][68] = 1;
		if (!((((int)((P0 *)Pptr(BASE+0))->_p)==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 75 - _spin_nvr.tmp:73 - [((mutex[1]._p==trying))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported75 = 0;
			if (verbose && !reported75)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported75 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported75 = 0;
			if (verbose && !reported75)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported75 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][75] = 1;
		if (!((((int)((P0 *)Pptr(BASE+1))->_p)==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 83 - _spin_nvr.tmp:78 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported83 = 0;
			if (verbose && !reported83)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported83 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported83 = 0;
			if (verbose && !reported83)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported83 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][83] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM prop2 */
	case 20: // STATE 1 - _spin_nvr.tmp:12 - [((!(!(((mutex[0]._p==trying)||(mutex[1]._p==trying))))&&!(((mutex[0]._p==critical)||(mutex[1]._p==critical)))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!(( !( !(((((int)((P0 *)Pptr(BASE+0))->_p)==3)||(((int)((P0 *)Pptr(BASE+1))->_p)==3))))&& !(((((int)((P0 *)Pptr(BASE+0))->_p)==6)||(((int)((P0 *)Pptr(BASE+1))->_p)==6))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 8 - _spin_nvr.tmp:17 - [(!(((mutex[0]._p==critical)||(mutex[1]._p==critical))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][8] = 1;
		if (!( !(((((int)((P0 *)Pptr(BASE+0))->_p)==6)||(((int)((P0 *)Pptr(BASE+1))->_p)==6)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 13 - _spin_nvr.tmp:19 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM prop1 */
	case 23: // STATE 1 - _spin_nvr.tmp:3 - [(((mutex[0]._p==critical)&&(mutex[1]._p==critical)))] (6:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[1][1] = 1;
		if (!(((((int)((P0 *)Pptr(BASE+0))->_p)==6)&&(((int)((P0 *)Pptr(BASE+1))->_p)==6))))
			continue;
		/* merge: assert(!(((mutex[0]._p==critical)&&(mutex[1]._p==critical))))(0, 2, 6) */
		reached[1][2] = 1;
		spin_assert( !(((((int)((P0 *)Pptr(BASE+0))->_p)==6)&&(((int)((P0 *)Pptr(BASE+1))->_p)==6))), " !(((mutex[0]._p==critical)&&(mutex[1]._p==critical)))", II, tt, t);
		/* merge: .(goto)(0, 7, 6) */
		reached[1][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 24: // STATE 10 - _spin_nvr.tmp:8 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported10 = 0;
			if (verbose && !reported10)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported10 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[1][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC mutex */
	case 25: // STATE 1 - ./final/peterson.pml:22 - [i = _pid] (0:3:2 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->i);
		((P0 *)_this)->i = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("mutex:i", ((int)((P0 *)_this)->i));
#endif
		;
		/* merge: j = (1-_pid)(3, 2, 3) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->j);
		((P0 *)_this)->j = (1-((int)((P0 *)_this)->_pid));
#ifdef VAR_RANGES
		logval("mutex:j", ((int)((P0 *)_this)->j));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 3 - ./final/peterson.pml:26 - [flag[i] = 1] (0:0:1 - 3)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[ Index(((int)((P0 *)_this)->i), 2) ]);
		now.flag[ Index(((P0 *)_this)->i, 2) ] = 1;
#ifdef VAR_RANGES
		logval("flag[mutex:i]", ((int)now.flag[ Index(((int)((P0 *)_this)->i), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 4 - ./final/peterson.pml:27 - [turn = i] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = ((int)((P0 *)_this)->i);
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 5 - ./final/peterson.pml:28 - [(!((flag[j]&&(turn==i))))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!( !((((int)now.flag[ Index(((int)((P0 *)_this)->j), 2) ])&&(((int)now.turn)==((int)((P0 *)_this)->i))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 6 - ./final/peterson.pml:31 - [ncrit = (ncrit+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.ncrit);
		now.ncrit = (((int)now.ncrit)+1);
#ifdef VAR_RANGES
		logval("ncrit", ((int)now.ncrit));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 7 - ./final/peterson.pml:32 - [assert((ncrit==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		spin_assert((((int)now.ncrit)==1), "(ncrit==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 8 - ./final/peterson.pml:33 - [ncrit = (ncrit-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)now.ncrit);
		now.ncrit = (((int)now.ncrit)-1);
#ifdef VAR_RANGES
		logval("ncrit", ((int)now.ncrit));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 9 - ./final/peterson.pml:35 - [flag[i] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[ Index(((int)((P0 *)_this)->i), 2) ]);
		now.flag[ Index(((P0 *)_this)->i, 2) ] = 0;
#ifdef VAR_RANGES
		logval("flag[mutex:i]", ((int)now.flag[ Index(((int)((P0 *)_this)->i), 2) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

