package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1522:String = "WN_CRETAE";
      
      public static const const_1459:String = "WN_CREATED";
      
      public static const const_925:String = "WN_DESTROY";
      
      public static const const_1005:String = "WN_DESTROYED";
      
      public static const const_1091:String = "WN_OPEN";
      
      public static const const_930:String = "WN_OPENED";
      
      public static const const_951:String = "WN_CLOSE";
      
      public static const const_1097:String = "WN_CLOSED";
      
      public static const const_916:String = "WN_FOCUS";
      
      public static const const_996:String = "WN_FOCUSED";
      
      public static const const_965:String = "WN_UNFOCUS";
      
      public static const const_972:String = "WN_UNFOCUSED";
      
      public static const const_1016:String = "WN_ACTIVATE";
      
      public static const const_379:String = "WN_ACTVATED";
      
      public static const const_1115:String = "WN_DEACTIVATE";
      
      public static const const_953:String = "WN_DEACTIVATED";
      
      public static const const_500:String = "WN_SELECT";
      
      public static const const_325:String = "WN_SELECTED";
      
      public static const const_579:String = "WN_UNSELECT";
      
      public static const const_580:String = "WN_UNSELECTED";
      
      public static const const_1046:String = "WN_LOCK";
      
      public static const const_908:String = "WN_LOCKED";
      
      public static const const_1051:String = "WN_UNLOCK";
      
      public static const const_1032:String = "WN_UNLOCKED";
      
      public static const const_991:String = "WN_ENABLE";
      
      public static const const_783:String = "WN_ENABLED";
      
      public static const const_1037:String = "WN_DISABLE";
      
      public static const const_638:String = "WN_DISABLED";
      
      public static const const_615:String = "WN_RESIZE";
      
      public static const const_177:String = "WN_RESIZED";
      
      public static const const_910:String = "WN_RELOCATE";
      
      public static const const_521:String = "WN_RELOCATED";
      
      public static const const_1041:String = "WN_MINIMIZE";
      
      public static const const_905:String = "WN_MINIMIZED";
      
      public static const const_988:String = "WN_MAXIMIZE";
      
      public static const const_1098:String = "WN_MAXIMIZED";
      
      public static const const_1054:String = "WN_RESTORE";
      
      public static const const_1094:String = "WN_RESTORED";
      
      public static const const_1623:String = "WN_ARRANGE";
      
      public static const const_1711:String = "WN_ARRANGED";
      
      public static const const_1743:String = "WN_UPDATE";
      
      public static const const_1651:String = "WN_UPDATED";
      
      public static const const_327:String = "WN_CHILD_ADDED";
      
      public static const const_714:String = "WN_CHILD_REMOVED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_300:String = "WN_CHILD_RELOCATED";
      
      public static const const_204:String = "WN_CHILD_ACTIVATED";
      
      public static const const_446:String = "WN_PARENT_ADDED";
      
      public static const const_1004:String = "WN_PARENT_REMOVED";
      
      public static const const_427:String = "WN_PARENT_RESIZED";
      
      public static const const_1050:String = "WN_PARENT_RELOCATED";
      
      public static const const_624:String = "WN_PARENT_ACTIVATED";
      
      public static const const_537:String = "WN_STATE_UPDATED";
      
      public static const const_424:String = "WN_STYLE_UPDATED";
      
      public static const const_531:String = "WN_PARAM_UPDATED";
      
      public static const const_1757:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1896,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
