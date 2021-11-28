#ifndef N
#define N 5
#endif


mtype = {noop, req1, req2};
chan input = [5] of {mtype};
chan buf = [5] of {mtype};
int idx = 0;
int lock = 0;

//for prop10
mtype t1_in = req2;
mtype t2_out = req2;

//for prop12
int t1_idx = 0;
int t2_idx = 0;

//for prop13
bool t2_exec = 0;

ltl prop10 { [] (t1_in==req1 ==> <>(t2_in==req1))}
ltl prop11 { [] ((<>(t1_in==req1) && <>(t1_in==noop)) ==> <>(t2_in==req1))}
ltl prop12 { [] (t1_idx>=0 && t1_idx<5 && t2_idx>=0 && t2_idx<5)}
ltl prop13 { [] ((([](<>t2_exec==1)) && (<>(t1_in==req1) && <>(t1_in==noop))) ==> <>(t2_in==req1))}

proctype thread1(){
again:	in ? input;
		t1_in = in;
		if
			:: in != noop -> {
				idx >= N;
				atomic{
					lock = 1;
					t1_idx = idx;
					input ? buf[idx];
					idx = idx+1;
					lock = 0;
				}
			};
			:: in == noop -> goto again;
		fi;

		goto again	
}

proctype thread2(){
again:	t2_exec = !t2_exec;
		idx == 0;
		atomic{
			lock = 1;
			t2_idx = idx;
			out ! buf[idx-1];
			t2_out = out;
			idx = idx-1;
			lock = 0;
		}


		goto again	
}

active proctype fillRand(){
	{do
	:: input ! noop;
	:: input ! req1;
	:: input ! req2;
	:: timeout -> break;
	od}
} 

init {
	run thread1();
	run thread2();
}