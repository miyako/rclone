//%attributes = {}
#DECLARE($params : Object)

If ($params=Null:C1517)
	
/*
async calls must be performed in a worker or form
*/
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $rclone : cs:C1710.Rclone
	$rclone:=cs:C1710.Rclone.new(cs:C1710._Rclone_Controller)
	$version:=$rclone.start(["version"]).controller._worker.wait().responseError
	
End if 