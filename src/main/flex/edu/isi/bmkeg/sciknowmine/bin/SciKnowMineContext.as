package edu.isi.bmkeg.sciknowmine.bin
{	
	import edu.isi.bmkeg.triageModule.TriageModuleContext;
	import edu.isi.bmkeg.triageModule.TriageModule;
		
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class SciKnowMineContext extends ModuleContext
	{

		override public function startup():void
		{
			// map the modules so that instances will be properly supplied (injected) with an injector.
			viewMap.mapType(TriageModule);		
		}
		
	}
	
}