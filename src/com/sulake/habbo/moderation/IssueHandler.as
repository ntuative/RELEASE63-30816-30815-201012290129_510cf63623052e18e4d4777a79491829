package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetCfhChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   import flash.utils.getTimer;
   
   public class IssueHandler implements TrackedWindow
   {
       
      
      private var var_59:ModerationManager;
      
      private var var_127:IssueBundle;
      
      private var _window:IFrameWindow;
      
      private var var_488:UserInfoCtrl;
      
      private var var_1130:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      public function IssueHandler(param1:ModerationManager, param2:IssueBundle)
      {
         super();
         this.var_59 = param1;
         this.var_127 = param2;
      }
      
      public function getType() : int
      {
         return WindowTracker.TYPE_ISSUEHANDLER;
      }
      
      public function getId() : String
      {
         return "" + this.var_127.id;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._window;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_488 != null)
         {
            this.var_488.dispose();
            this.var_488 = null;
         }
         if(this.var_1130 != null)
         {
            this.var_1130.dispose();
            this.var_1130 = null;
         }
         this.var_59 = null;
         this.var_127 = null;
      }
      
      public function show() : void
      {
         this.createView();
      }
      
      private function createView() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this._window != null)
         {
            return;
         }
         if(this.var_59.windowManager == null || this.var_59.assets == null)
         {
            return;
         }
         var _loc1_:XmlAsset = this.var_59.assets.getAssetByName("issue_handler_xml") as XmlAsset;
         if(_loc1_ == null || _loc1_.content == null)
         {
            return;
         }
         this._window = this.var_59.windowManager.buildFromXML(_loc1_.content as XML) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IWindow = this._window.findChildByTag("close");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
         _loc2_ = this._window.findChildByName("issue_cont");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(WindowEvent.const_45,this.onResized);
         }
         this.setProc("close_useless",this.onCloseUseless);
         this.setProc("close_abusive",this.onCloseAbusive);
         this.setProc("close_resolved",this.onCloseResolved);
         this.setProc("release",this.onRelease);
         this.setProc("move_to_player_support",this.onMoveToPlayerSupport);
         this.setProc("show_chatlog",this.onShowChatlog);
         this.var_59.disableButton(this.var_59.initMsg.chatlogsPermission,this._window,"show_chatlog");
         _loc2_ = this._window.findChildByName("move_to_player_support");
         if(_loc2_ != null)
         {
            _loc2_.disable();
         }
         var _loc3_:IssueMessageData = this.var_127.getHighestPriorityIssue();
         this.var_488 = new UserInfoCtrl(this._window,this.var_59,_loc3_.message);
         this.var_1130 = new UserInfoCtrl(this._window,this.var_59,_loc3_.message);
         this.var_488.load(IWindowContainer(this._window.findChildByName("caller_user_info")),this.var_127.getHighestPriorityIssue().reporterUserId);
         var _loc4_:IWindowContainer = IWindowContainer(this._window.findChildByName("reported_user_info"));
         if(this.var_127.reportedUserId > 0)
         {
            this.var_1130.load(_loc4_,this.var_127.reportedUserId);
         }
         else
         {
            _loc6_ = IItemListWindow(this._window.findChildByName("issue_cont"));
            _loc7_ = this._window.findChildByName("reported_user_info_caption");
            _loc6_.removeListItem(_loc7_);
            _loc6_.removeListItem(_loc4_);
         }
         var _loc5_:ICheckBoxWindow = this._window.findChildByName("handle_next_checkbox") as ICheckBoxWindow;
         if(_loc5_ != null)
         {
            _loc5_.select();
         }
         Logger.log("HARASSER: " + this.var_127.reportedUserId);
         this.updateIssueList();
         this.updateMessages();
      }
      
      private function onResized(param1:WindowEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = param1.window as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IItemListWindow = _loc2_.getListItemByName("issues_item_list") as IItemListWindow;
         var _loc4_:IItemListWindow = _loc2_.getListItemByName("msg_item_list") as IItemListWindow;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:int = (_loc2_.height - _loc2_.scrollableRegion.height + _loc3_.height + _loc4_.height) * 0.5;
         _loc2_.autoArrangeItems = false;
         _loc3_.height = _loc5_;
         _loc4_.height = _loc5_;
         _loc2_.autoArrangeItems = true;
      }
      
      private function updateIssueList() : void
      {
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = this._window.findChildByName("issues_item_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeListItems();
         var _loc2_:XmlAsset = this.var_59.assets.getAssetByName("issue_handler_issue_info_xml") as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = this.var_59.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = this.var_127.issues;
         var _loc5_:int = 0;
         var _loc7_:int = getTimer();
         for each(_loc6_ in _loc4_)
         {
            _loc8_ = _loc3_.clone() as IWindowContainer;
            if(_loc8_ == null)
            {
               return;
            }
            _loc8_.background = _loc5_++ % 2 == 0;
            _loc1_.addListItem(_loc8_);
            _loc9_ = _loc8_.findChildByName("reporter");
            if(_loc9_ != null)
            {
               _loc9_.caption = _loc6_.reporterUserName;
               _loc9_.id = _loc6_.reporterUserId;
               _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onReporterClicked);
            }
            this.setCaption(_loc8_.findChildByName("category"),IssueCategoryNames.getCategoryName(_loc6_.reportedCategoryId));
            this.setCaption(_loc8_.findChildByName("room"),_loc6_.roomName);
            this.setCaption(_loc8_.findChildByName("time_open"),_loc6_.getOpenTime(_loc7_));
         }
      }
      
      private function updateMessages() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = this._window.findChildByName("msg_item_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeListItems();
         var _loc2_:XmlAsset = this.var_59.assets.getAssetByName("issue_handler_message_list_item_xml") as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return;
         }
         var _loc3_:ITextWindow = this.var_59.windowManager.buildFromXML(_loc2_.content as XML) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = this.var_127.issues;
         var _loc5_:int = 0;
         for each(_loc6_ in _loc4_)
         {
            _loc7_ = _loc3_.clone() as ITextWindow;
            if(_loc7_ == null)
            {
               return;
            }
            _loc1_.addListItem(_loc7_);
            _loc7_.width = _loc1_.width;
            _loc7_.background = _loc5_++ % 2 == 0;
            _loc7_.caption = _loc6_.reporterUserName + ": " + _loc6_.message;
            _loc7_.height = _loc7_.textHeight + 10;
         }
      }
      
      private function setCaption(param1:IWindow, param2:String) : void
      {
         if(param1 != null)
         {
            param1.caption = param2;
         }
      }
      
      private function setProc(param1:String, param2:Function) : void
      {
         this._window.findChildByName(param1).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         if(this.var_59 != null && this.var_59.issueManager != null && this.var_127 != null)
         {
            this.var_59.issueManager.removeHandler(this.var_127.id);
         }
         this.dispose();
      }
      
      private function onCloseUseless(param1:WindowMouseEvent) : void
      {
         Logger.log("Close useless clicked");
         this.var_59.issueManager.closeBundle(this.var_127.id,1);
         this.checkAutoHandling();
         this.dispose();
      }
      
      private function onCloseAbusive(param1:WindowMouseEvent) : void
      {
         Logger.log("Close abusive clicked");
         this.var_59.issueManager.closeBundle(this.var_127.id,2);
         this.checkAutoHandling();
         this.dispose();
      }
      
      private function onCloseResolved(param1:WindowMouseEvent) : void
      {
         Logger.log("Close resolved clicked");
         this.var_59.issueManager.closeBundle(this.var_127.id,3);
         this.checkAutoHandling();
         this.dispose();
      }
      
      private function onRelease(param1:WindowMouseEvent) : void
      {
         Logger.log("Release clicked");
         this.var_59.issueManager.releaseBundle(this.var_127.id);
         this.checkAutoHandling();
         this.dispose();
      }
      
      private function onMoveToPlayerSupport(param1:WindowMouseEvent) : void
      {
         Logger.log("Move to player support clicked");
      }
      
      private function onShowChatlog(param1:WindowMouseEvent) : void
      {
         Logger.log("Show chatlog clicked");
         var _loc2_:int = this.var_127.getHighestPriorityIssue().issueId;
         this.var_59.windowTracker.show(new ChatlogCtrl(new GetCfhChatlogMessageComposer(_loc2_),this.var_59,WindowTracker.const_1064,_loc2_),this._window,false,false,true);
      }
      
      private function onReporterClicked(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = param1.window.id;
         if(_loc2_ != 0)
         {
            if(this.var_488 != null)
            {
               this.var_488.dispose();
            }
            _loc3_ = this.var_127.getHighestPriorityIssue();
            this.var_488 = new UserInfoCtrl(this._window,this.var_59,_loc3_.message);
            this.var_488.load(IWindowContainer(this._window.findChildByName("caller_user_info")),_loc2_);
         }
      }
      
      public function update() : void
      {
         this.updateIssueList();
         this.updateMessages();
      }
      
      private function checkAutoHandling() : void
      {
         if(this._window == null || this.var_59 == null || this.var_59.issueManager == null)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("handle_next_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null && _loc1_.isSelected)
         {
            this.var_59.issueManager.autoPick();
         }
      }
   }
}
