package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1360:String = "WE_CREATE";
      
      public static const const_1450:String = "WE_CREATED";
      
      public static const const_1384:String = "WE_DESTROY";
      
      public static const const_277:String = "WE_DESTROYED";
      
      public static const const_1406:String = "WE_OPEN";
      
      public static const const_1511:String = "WE_OPENED";
      
      public static const const_1449:String = "WE_CLOSE";
      
      public static const const_1396:String = "WE_CLOSED";
      
      public static const const_1472:String = "WE_FOCUS";
      
      public static const const_168:String = "WE_FOCUSED";
      
      public static const const_1258:String = "WE_UNFOCUS";
      
      public static const const_1313:String = "WE_UNFOCUSED";
      
      public static const const_1345:String = "WE_ACTIVATE";
      
      public static const const_1436:String = "WE_ACTIVATED";
      
      public static const const_1426:String = "WE_DEACTIVATE";
      
      public static const const_894:String = "WE_DEACTIVATED";
      
      public static const const_485:String = "WE_SELECT";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_813:String = "WE_UNSELECT";
      
      public static const const_676:String = "WE_UNSELECTED";
      
      public static const const_1629:String = "WE_ATTACH";
      
      public static const const_1762:String = "WE_ATTACHED";
      
      public static const const_1779:String = "WE_DETACH";
      
      public static const const_1744:String = "WE_DETACHED";
      
      public static const const_1516:String = "WE_LOCK";
      
      public static const const_1469:String = "WE_LOCKED";
      
      public static const const_1442:String = "WE_UNLOCK";
      
      public static const const_1503:String = "WE_UNLOCKED";
      
      public static const const_573:String = "WE_ENABLE";
      
      public static const const_305:String = "WE_ENABLED";
      
      public static const const_614:String = "WE_DISABLE";
      
      public static const const_251:String = "WE_DISABLED";
      
      public static const const_1482:String = "WE_RELOCATE";
      
      public static const const_380:String = "WE_RELOCATED";
      
      public static const const_1408:String = "WE_RESIZE";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1376:String = "WE_MINIMIZE";
      
      public static const const_1353:String = "WE_MINIMIZED";
      
      public static const const_1315:String = "WE_MAXIMIZE";
      
      public static const const_1298:String = "WE_MAXIMIZED";
      
      public static const const_1473:String = "WE_RESTORE";
      
      public static const const_1494:String = "WE_RESTORED";
      
      public static const const_1689:String = "WE_ARRANGE";
      
      public static const const_1655:String = "WE_ARRANGED";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1634:String = "WE_UPDATED";
      
      public static const const_1756:String = "WE_CHILD_RELOCATE";
      
      public static const const_425:String = "WE_CHILD_RELOCATED";
      
      public static const const_1663:String = "WE_CHILD_RESIZE";
      
      public static const const_294:String = "WE_CHILD_RESIZED";
      
      public static const const_1813:String = "WE_CHILD_REMOVE";
      
      public static const const_509:String = "WE_CHILD_REMOVED";
      
      public static const const_1791:String = "WE_PARENT_RELOCATE";
      
      public static const const_1705:String = "WE_PARENT_RELOCATED";
      
      public static const const_1781:String = "WE_PARENT_RESIZE";
      
      public static const const_1512:String = "WE_PARENT_RESIZED";
      
      public static const const_182:String = "WE_OK";
      
      public static const const_623:String = "WE_CANCEL";
      
      public static const const_107:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_542:String = "WE_SCROLL";
      
      public static const const_153:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1896:IWindow;
      
      protected var var_1897:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1896 = param3;
         this.var_1897 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1896;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1897 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1897;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
