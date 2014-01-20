package edu.isi.bmkeg.sciknowmine.dashboard.controller
{	
	import edu.isi.bmkeg.sciknowmine.dashboard.model.*;
	import edu.isi.bmkeg.triage.events.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	import org.robotlegs.mvcs.Command;
	
	public class ReadCorpusCountsResultCommand extends Command
	{
		
		[Inject]
		public var event:ReadCorpusCountsResultEvent;
		
		[Inject]
		public var model:DashboardModel;
		
		override public function execute():void {
			
			var l:ArrayCollection = new ArrayCollection();
			var l2:ArrayCollection = new ArrayCollection();
			var hash:Object = new Object();

			for each(var s:String in event.list) {
				
				var data:Array = s.split(/\{\|\}/);
				var o:Object = new Object();
				
				var target:String = data[0];
				var triage:String = data[1];
				var inOutUnc:String = data[2] + "/" + data[3] + "/" + data[4];
				
				if( triage == "final" ) {
					var o2:Object = new Object();
					l2.addItem(o2);
					o2["corpus"] = target; 
					o2["count"] = data[2]; 
					continue;
				}
			
				if( hash[triage] == null ) {
					hash[triage] = new Object();
					hash[triage]["triage"] = triage;
					l.addItem( hash[triage] );
				}
				
				hash[triage][target] = inOutUnc;
							
			}			
			
			var dataSortField:SortField = new SortField();
			dataSortField.name = "triage";
			dataSortField.numeric = false;
			var sortThis:Sort = new Sort();
			sortThis.fields = [dataSortField];
			l.sort = sortThis;
			l.refresh();
			
			model.triageCorpusCounts = l;
			model.articleCorpusCounts = l2;
			
		}
		
	}
	
}
