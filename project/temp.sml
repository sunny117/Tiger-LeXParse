signature TEMP = sig
	type temp
	type label
	val newlabel : unit -> label
	val newtemp : unit -> temp
	val namedlabel : string -> label
end

structure Temp : TEMP = struct 
	type temp = int;
	type label = string;
	val temps = ref 0
	val labels = ref 0
	fun newlabel () = ((labels :=(!labels+1)); ("label"^(Int.toString(!labels))));
	fun newtemp () = ((temps :=(!temps+1)); !temps);
	fun namedlabel s = newlabel (); 
end
