Class extends _CLI

Class constructor($controller : 4D:C1709.Class)
	
	Super:C1705("rclone"; $controller)
	
Function _terminate()
	
	This:C1470.controller.terminate()
	
Function start($options : Collection) : cs:C1710.Rclone
	
	$command:=This:C1470.escape(This:C1470.executablePath)
	
	var $option : Variant
	For each ($option; $options)
		
		Case of 
			: (Value type:C1509($option)=Is object:K8:27)
				Case of 
					: (OB Instance of:C1731($option; 4D:C1709.File)) || (OB Instance of:C1731($option; 4D:C1709.Folder))
						$command+=" "+This:C1470.quote(This:C1470.expand($option).path)
				End case 
				
			: (Value type:C1509($option)=Is text:K8:3)
				Case of 
					: ($option="-@")
						$command+=" "+$option
					Else 
						$command+=" "+This:C1470.quote($option)
				End case 
				
			Else 
				$command+=" "+This:C1470.quote(String:C10($option))
		End case 
		
	End for each 
	
	This:C1470.controller.execute($command)
	
	return This:C1470