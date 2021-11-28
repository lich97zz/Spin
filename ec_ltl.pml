#ifndef N
#define N 5
#endif

mtype = {};

mtype = {noop, req1, req2};
chan input = [5] of {mtype};
chan buf = [5] of {mtype};
byte idx = 0
byte lock = 0

proctype thread1(){
again:	in ? input;
		if
			:: in != noop -> {
				idx >= N;
				atomic{
					lock = 1;
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
again:	idx == N;
		atomic{
			lock = 1;
			out ! buf[idx-1];
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