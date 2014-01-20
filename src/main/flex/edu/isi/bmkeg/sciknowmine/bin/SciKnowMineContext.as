package edu.isi.bmkeg.sciknowmine.bin
{	
	import edu.isi.bmkeg.sciknowmine.dashboard.*;
	import edu.isi.bmkeg.triageModule.*;
	import edu.isi.bmkeg.digitalLibraryModule.*;
	import edu.isi.bmkeg.lapdftextModule.*;
		
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class SciKnowMineContext extends ModuleContext
	{

		override public function startup():void
		{
			// map the modules so that instances will be properly supplied (injected) with an injector.
			viewMap.mapType(DigitalLibraryModule);		
			viewMap.mapType(TriageModule);		
			viewMap.mapType(LapdftextModule);		
			viewMap.mapType(DashboardModule);		
		}
		
	}
	
}