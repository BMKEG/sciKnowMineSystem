package edu.isi.bmkeg.sciknowmine.dashboard
{
	
	import edu.isi.bmkeg.sciknowmine.dashboard.controller.*;
	import edu.isi.bmkeg.sciknowmine.dashboard.model.*;
	import edu.isi.bmkeg.sciknowmine.dashboard.view.*;
	import edu.isi.bmkeg.triage.events.*;
	import edu.isi.bmkeg.triage.services.IExtendedTriageService;
	import edu.isi.bmkeg.triage.services.impl.ExtendedTriageServiceImpl;
	import edu.isi.bmkeg.triage.services.serverInteraction.IExtendedTriageServer;
	import edu.isi.bmkeg.triage.services.serverInteraction.impl.ExtendedTriageServerImpl;
	import edu.isi.bmkeg.utils.serverUpdates.events.ServerUpdateEvent;
	import edu.isi.bmkeg.utils.serverUpdates.services.IServerUpdateService;
	import edu.isi.bmkeg.utils.serverUpdates.services.impl.ServerUpdateServiceImpl;
	import edu.isi.bmkeg.utils.serverUpdates.services.serverInteraction.IServerUpdateServer;
	import edu.isi.bmkeg.utils.serverUpdates.services.serverInteraction.impl.ServerUpdateServerImpl;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class DashboardModuleContext extends ModuleContext
	{

		public function DashboardModuleContext(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{		
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// views and mediators
			// e.g., 
			//	 - mediatorMap.mapView(TriageCorpusControl, TriageCorpusControlMediator);
			mediatorMap.mapView(TriagedCorpusCountGrid, TriagedCorpusCountGridMediator);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// popups.
			// e.g., 
			//   - mediatorMap.mapView(UploadPdfsPopup, UploadPdfsPopupMediator, null, false, false);
			//   - mediatorMap.mapView(ClassifierPopup, ClassifierPopupMediator, null, false, false);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// models.
			// e.g., 
			//   - injector.mapSingleton(TriageModel);
			//   - injector.mapSingleton(TriageCorpusPagedListModel);
			injector.mapSingleton(DashboardModel);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// services and servers.
			// e.g., 
			//   - injector.mapSingletonOf(IServerUpdateServer, ServerUpdateServerImpl);
			//   - injector.mapSingletonOf(IServerUpdateService, ServerUpdateServiceImpl);
			injector.mapSingletonOf(IExtendedTriageService, ExtendedTriageServiceImpl);
			injector.mapSingletonOf(IExtendedTriageServer, ExtendedTriageServerImpl);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// events and commands.
			// e.g., 
			//   - commandMap.mapEvent(ServerUpdateEvent.SERVER_UPDATE, ServerUpdateCommand);
			commandMap.mapEvent(ReadCorpusCountsEvent.READ_CORPUS_COUNTS, 
					ReadCorpusCountsCommand);
			commandMap.mapEvent(ReadCorpusCountsResultEvent.READ_CORPUS_COUNTS_RESULT, 
					ReadCorpusCountsResultCommand);
			
			commandMap.mapEvent(TransferTriageInsToArticleCorporaEvent.TRANSFER_TRIAGE_INS_TO_ARTICLE_CORPORA, 
				TransferTriageInsToArticleCorporaCommand);
			commandMap.mapEvent(TransferTriageInsToArticleCorporaResultEvent.TRANSFER_TRIAGE_INS_TO_ARTICLE_CORPORA_RESULT, 
				TransferTriageInsToArticleCorporaResultCommand);
			
			
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}