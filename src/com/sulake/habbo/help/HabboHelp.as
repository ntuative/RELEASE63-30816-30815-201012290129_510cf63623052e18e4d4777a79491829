package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_289:IHabboCommunicationManager;
      
      private var var_935:IHabboLocalizationManager;
      
      private var var_933:IHabboConfigurationManager;
      
      private var var_1160:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_61:HelpUI;
      
      private var var_171:TutorialUI;
      
      private var var_757:HotelMergeUI;
      
      private var var_934:RegistrationUI;
      
      private var var_1424:CallForHelpData;
      
      private var var_2616:UserRegistry;
      
      private var var_2271:String = "";
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1424 = new CallForHelpData();
         this.var_2616 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1160 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2271 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2271;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1424;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2616;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_935;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_171;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_757;
      }
      
      override public function dispose() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.dispose();
            this.var_61 = null;
         }
         if(this.var_171 != null)
         {
            this.var_171.dispose();
            this.var_171 = null;
         }
         if(this.var_757)
         {
            this.var_757.dispose();
            this.var_757 = null;
         }
         if(this.var_934 != null)
         {
            this.var_934.dispose();
            this.var_934 = null;
         }
         if(this.var_1160 != null)
         {
            this.var_1160.dispose();
            this.var_1160 = null;
         }
         this._incomingMessages = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_935)
         {
            this.var_935.release(new IIDHabboLocalizationManager());
            this.var_935 = null;
         }
         if(this.var_289)
         {
            this.var_289.release(new IIDHabboCommunicationManager());
            this.var_289 = null;
         }
         if(this.var_933)
         {
            this.var_933.release(new IIDHabboConfigurationManager());
            this.var_933 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_61 != null)
         {
            this.var_61.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1160;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_289 != null && param1 != null)
         {
            this.var_289.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_933 == null)
         {
            return param1;
         }
         return this.var_933.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_61 != null)
         {
            this.var_61.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1424.reportedUserId = param1;
         this.var_1424.reportedUserName = param2;
         this.var_61.showUI(HabboHelpViewEnum.const_353);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_61 == null)
         {
            if(!this.method_5())
            {
               return;
            }
         }
         this.var_61.toggleUI();
      }
      
      private function method_5() : Boolean
      {
         if(this.var_61 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_61 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_935,this._toolbar);
         }
         return this.var_61 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         if(this.var_171 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_171 = new TutorialUI(this);
         }
         return this.var_171 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_171 != null)
         {
            this.var_171.dispose();
            this.var_171 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_757)
         {
            this.var_757 = new HotelMergeUI(this);
         }
         this.var_757.startNameChange();
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_934)
         {
            this.var_934 = new RegistrationUI(this);
         }
         this.var_934.showRegistrationView();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_171 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_171.update(param1,param2,param3);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_289 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_289);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_935 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_933 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_84,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_88,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_67,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_39,this.onHabboToolbarEvent);
         this.method_5();
         this.setHabboToolbarIcon();
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_84:
               if(this.var_61 != null)
               {
                  this.var_61.setRoomSessionStatus(true);
               }
               if(this.var_171 != null)
               {
                  this.var_171.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_88:
               if(this.var_61 != null)
               {
                  this.var_61.setRoomSessionStatus(false);
               }
               if(this.var_171 != null)
               {
                  this.var_171.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this._toolbar != null)
         {
            this._toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_112,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_67)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_39)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
   }
}
