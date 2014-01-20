package edu.isi.bmkeg.sciknowmine.dashboard.controller
{	
	import edu.isi.bmkeg.sciknowmine.dashboard.model.*;
	import edu.isi.bmkeg.triage.events.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import org.robotlegs.mvcs.Command;
	
	public class TransferTriageInsToArticleCorporaResultCommand extends Command
	{
		
		[Inject]
		public var event:TransferTriageInsToArticleCorporaResultEvent;
		
		[Inject]
		public var model:DashboardModel;
		
		override public function execute():void {
			
			this.dispatch(
				new ReadCorpusCountsEvent()
			);
			
		}
		
	}
	
}
