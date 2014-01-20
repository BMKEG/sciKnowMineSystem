package edu.isi.bmkeg.sciknowmine.dashboard.controller
{	
	import org.robotlegs.mvcs.Command;

	import edu.isi.bmkeg.triage.events.*;
	import edu.isi.bmkeg.triage.services.IExtendedTriageService;
	import edu.isi.bmkeg.sciknowmine.dashboard.model.*;
	
	import flash.events.Event;
	
	public class TransferTriageInsToArticleCorporaCommand extends Command
	{
	
		[Inject]
		public var event:TransferTriageInsToArticleCorporaEvent;

		[Inject]
		public var service:IExtendedTriageService;

		override public function execute():void {

			service.transferTriageInsToArticleCorpora();

		}
		
	}
	
}