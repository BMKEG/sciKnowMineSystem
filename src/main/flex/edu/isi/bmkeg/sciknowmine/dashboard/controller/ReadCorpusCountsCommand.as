package edu.isi.bmkeg.sciknowmine.dashboard.controller
{	
	import org.robotlegs.mvcs.Command;

	import edu.isi.bmkeg.triage.events.*;
	import edu.isi.bmkeg.triage.services.IExtendedTriageService;
	import edu.isi.bmkeg.sciknowmine.dashboard.model.*;
	
	import flash.events.Event;
	
	public class ReadCorpusCountsCommand extends Command
	{
	
		[Inject]
		public var event:ReadCorpusCountsEvent;

		[Inject]
		public var service:IExtendedTriageService;

		override public function execute():void {

			service.readAllCorpusCounts();

		}
		
	}
	
}