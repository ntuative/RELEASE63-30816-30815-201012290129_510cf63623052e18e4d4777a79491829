package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   import flash.display.BitmapData;
   import flash.utils.getTimer;
   
   public class IssueListView
   {
       
      
      private var _issueManager:IssueManager;
      
      private var var_623:IssueBrowser;
      
      private var var_53:IItemListWindow;
      
      private var var_1646:String;
      
      private var var_1579:IWindowContainer;
      
      private var var_2711:BitmapData;
      
      private var var_2710:BitmapData;
      
      public function IssueListView(param1:IssueManager, param2:IssueBrowser, param3:IItemListWindow, param4:String)
      {
         super();
         this._issueManager = param1;
         this.var_623 = param2;
         this.var_53 = param3;
         this.var_1646 = param4;
         this.var_1579 = this.var_623.createWindow(param4) as IWindowContainer;
      }
      
      public function update(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(this.var_53 == null)
         {
            return;
         }
         this.var_53.destroyListItems();
         this.var_53.invalidate();
         if(param1 == null)
         {
            return;
         }
         param1.sort(this.sortByPriority);
         var _loc4_:int = 1;
         var _loc6_:int = getTimer();
         for each(_loc5_ in param1)
         {
            if(_loc4_ > 20)
            {
               break;
            }
            if(_loc5_ == null || this.var_1579 == null)
            {
               return;
            }
            _loc2_ = this.var_1579.clone() as IWindowContainer;
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.width = this.var_53.width;
            _loc2_.color = !!(_loc4_++ % 2) ? 4289914618 : uint(4294967295);
            _loc3_ = _loc2_.findChildByName("score");
            if(_loc3_ != null)
            {
               _loc3_.caption = _loc5_.getPrioritySum().toString();
            }
            _loc7_ = _loc5_.getHighestPriorityIssue();
            if(_loc7_ == null)
            {
               return;
            }
            _loc3_ = _loc2_.findChildByName("category");
            if(_loc3_ != null)
            {
               _loc3_.caption = IssueCategoryNames.getCategoryName(_loc7_.reportedCategoryId);
            }
            _loc3_ = _loc2_.findChildByName("target_name");
            if(_loc3_ != null)
            {
               if(_loc7_.reportedUserId != 0)
               {
                  _loc3_.caption = _loc7_.reportedUserName;
               }
               else
               {
                  _loc3_.caption = _loc7_.roomName;
               }
            }
            _loc8_ = _loc2_.findChildByName("target_icon") as IBitmapWrapperWindow;
            if(_loc8_ != null)
            {
               _loc9_ = !!_loc7_.reportedUserId ? "user_icon_png" : "room_icon_png";
               _loc10_ = this.var_623.assets.getAssetByName(_loc9_) as BitmapDataAsset;
               if(_loc10_ != null && _loc10_.content as BitmapData != null)
               {
                  _loc11_ = _loc10_.content as BitmapData;
                  if(_loc11_ != null)
                  {
                     _loc8_.bitmap = _loc11_.clone();
                  }
               }
            }
            _loc3_ = _loc2_.findChildByName("time");
            if(_loc3_ != null)
            {
               _loc3_.caption = _loc5_.getOpenTime(_loc6_);
            }
            _loc3_ = _loc2_.findChildByName("msgs");
            if(_loc3_ != null)
            {
               _loc3_.caption = _loc5_.getMessageCount().toString();
            }
            _loc3_ = _loc2_.findChildByName("picker");
            if(_loc3_ != null)
            {
               _loc3_.caption = _loc5_.pickerName;
            }
            _loc3_ = _loc2_.findChildByName("pick_button");
            if(_loc3_ != null)
            {
               _loc3_.id = _loc5_.id;
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPick);
            }
            _loc3_ = _loc2_.findChildByName("handle_button");
            if(_loc3_ != null)
            {
               _loc3_.id = _loc5_.id;
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onHandle);
            }
            _loc3_ = _loc2_.findChildByName("release_button");
            if(_loc3_ != null)
            {
               _loc3_.id = _loc5_.id;
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRelease);
            }
            this.var_53.addListItem(_loc2_);
         }
      }
      
      private function sortByPriority(param1:IssueBundle, param2:IssueBundle) : Number
      {
         if(param1 == null || param2 == null)
         {
            return 0;
         }
         var _loc3_:int = param1.getPrioritySum();
         var _loc4_:int = param2.getPrioritySum();
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      private function onPick(param1:WindowMouseEvent) : void
      {
         if(this._issueManager == null)
         {
            return;
         }
         this._issueManager.pickBundle(param1.window.id);
      }
      
      private function onHandle(param1:WindowMouseEvent) : void
      {
         if(this.var_623 == null)
         {
            return;
         }
         this._issueManager.handleBundle(param1.window.id);
      }
      
      private function onRelease(param1:WindowMouseEvent) : void
      {
         if(this._issueManager == null)
         {
            return;
         }
         this._issueManager.releaseBundle(param1.window.id);
      }
   }
}
