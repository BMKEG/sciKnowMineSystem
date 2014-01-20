package edu.isi.bmkeg.sciknowmine.dashboard.view
{
	import edu.isi.bmkeg.sciknowmine.dashboard.model.DashboardModel;
	import edu.isi.bmkeg.triage.events.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.core.ClassFactory;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.DataGrid;
	import spark.components.gridClasses.GridColumn;
	
	public class TriagedCorpusCountGridMediator extends Mediator
	{
		[Inject]
		public var view:TriagedCorpusCountGrid;
		
		[Inject]
		public var model:DashboardModel;
		
		override public function onRegister():void
		{
												
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// List the triage corpora. 
			addViewListener(
				TransferTriageInsToArticleCorporaEvent.TRANSFER_TRIAGE_INS_TO_ARTICLE_CORPORA,	
				dispatch);
			
			addContextListener(ReadCorpusCountsResultEvent.READ_CORPUS_COUNTS_RESULT, 
				buildCountMatrix);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// On loading this control, we first list all the corpora on the server
			dispatch(new ReadCorpusCountsEvent());
			
		}	
		
		public function buildCountMatrix(event:ReadCorpusCountsResultEvent):void {
			
			var l:ArrayCollection = model.triageCorpusCounts;
			
			var dg:DataGrid = view.triageCorporaDataGrid;
			
			dg.columns.removeAll();
			
			// pmid column
			var col1:GridColumn = new GridColumn();
			col1.headerText = "Triage Corpus";
			col1.dataField = "triage";
			dg.columns.addItem(col1);

			if( l == null || l.length == 0 )
				return;
			
			for( var corpusName:String in l.getItemAt(0) ) {
				if( corpusName == "triage" )
					continue;
				var colN:GridColumn = new GridColumn();
				colN.headerText = corpusName + "\n+/-/?";
				
				colN.dataField = corpusName;
				dg.columns.addItem(colN);
			}
			
			view.triageCorporaCounts = l;
			view.articleCorporaCounts = model.articleCorpusCounts;
			
		}

	}
	
}