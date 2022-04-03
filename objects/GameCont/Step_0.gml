/// @description Increment time, depth sorting

time = min(++time, maxtime);

with all if object_index != GameCont && visible {
	var depthBaseCheck = variable_instance_get(self, "depthBase");
	if depthBaseCheck == undefined {
		depthBase = depth
	}
	var zCheck = variable_instance_get(self, "z");
	zCheck = zCheck == undefined ? 0 : zCheck
	depth = depthBase - (bbox_top + zCheck) div 10
}
