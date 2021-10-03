package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_174:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_247:String = "RWUIUE_PEER";
      
      public static const const_1438:int = 0;
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const const_891:int = 2;
      
      public static const const_982:int = 3;
      
      public static const const_1404:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1867:String = "";
      
      private var var_1928:int;
      
      private var var_1933:int = 0;
      
      private var var_1934:int = 0;
      
      private var var_561:String = "";
      
      private var var_39:BitmapData = null;
      
      private var var_251:Array;
      
      private var var_1350:int = 0;
      
      private var var_1925:String = "";
      
      private var var_1927:int = 0;
      
      private var var_1929:int = 0;
      
      private var var_1784:Boolean = false;
      
      private var var_1510:String = "";
      
      private var var_1939:Boolean = false;
      
      private var var_1935:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_1937:Boolean = false;
      
      private var var_1932:Boolean = false;
      
      private var var_1936:Boolean = false;
      
      private var var_1931:Boolean = false;
      
      private var var_1930:Boolean = false;
      
      private var var_1938:Boolean = false;
      
      private var var_1926:int = 0;
      
      private var var_1781:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_251 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1867 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1867;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_1928 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1928;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_1933 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_1933;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_1934 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_1934;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_561 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_39 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_251 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_251;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1350 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1350;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_1925 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_1925;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_1939 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_1939;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_1937 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_1937;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_1932 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_1932;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_1936 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_1936;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_1931 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_1931;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_1930 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_1930;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_1938 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_1938;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_1926 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_1926;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_1935 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_1935;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1781 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1781;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_1927 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_1927;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_1929 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_1929;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1784 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1784;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1510 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1510;
      }
   }
}
