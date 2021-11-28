#ifndef N
#define N 5
#endif
ltl prop10 { [] (t1_in==req1 ==> <>(t2_in==req1))}

mtype = {noop, req1, req2};
chan input = [5] of {mtype};
mtype buf[5];
int idx = 0;
int lock = 0;
int max_len = 1000;
int i = 0;
//for prop10
mtype t1_in = req2;
mtype t2_out = req2;

//for prop12
int t1_idx = 0;
int t2_idx = 0;

//for prop13
bool t2_exec = 0;





proctype thread1(){
mtype in;
again:	
		if :: i>max_len -> goto end
		   :: skip;
		fi
		input ? in;
		t1_in = in;
		if
			:: in != noop -> {
				idx < N;
				atomic{
					lock = 1;
					t1_idx = idx;

					buf[idx] = in;
					idx = idx+1;
					lock = 0;
				}
			};
			:: in == noop -> goto again;
		fi;
		i = i+1;
		
		goto again
end:
	printf("reaching maximum depth, manually end\n");		
}

proctype thread2(){
mtype out;
again:	
		if :: i>max_len -> goto end
		   :: skip;
		fi
		t2_exec = !t2_exec;
		idx > 0;
		atomic{
			lock = 1;
			t2_idx = idx;
			out = buf[idx-1];
			t2_out = out;
			idx = idx-1;
			lock = 0;
			
		}
		i = i+1;
		goto again
end:
	printf("reaching maximum depth, manually end\n");	
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