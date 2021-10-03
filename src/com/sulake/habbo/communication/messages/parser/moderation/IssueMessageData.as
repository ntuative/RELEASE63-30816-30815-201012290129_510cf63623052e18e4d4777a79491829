package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_144:int = 1;
      
      public static const const_370:int = 2;
      
      public static const const_1309:int = 3;
       
      
      private var var_2208:int;
      
      private var _state:int;
      
      private var var_1345:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1571:int;
      
      private var var_2212:int;
      
      private var var_2206:int = 0;
      
      private var var_2202:int;
      
      private var var_2207:String;
      
      private var var_1288:int;
      
      private var var_1606:String;
      
      private var var_2203:int;
      
      private var var_2210:String;
      
      private var _message:String;
      
      private var var_2204:int;
      
      private var var_909:String;
      
      private var var_1610:int;
      
      private var var_2201:String;
      
      private var var_315:int;
      
      private var var_2205:String;
      
      private var var_2211:String;
      
      private var var_2149:int;
      
      private var var_2209:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function get issueId() : int
      {
         return this.var_2208;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1345;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1571;
      }
      
      public function get priority() : int
      {
         return this.var_2212 + this.var_2206;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2202;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2207;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1288;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1606;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2203;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2210;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2204;
      }
      
      public function get roomName() : String
      {
         return this.var_909;
      }
      
      public function get roomType() : int
      {
         return this.var_1610;
      }
      
      public function get flatType() : String
      {
         return this.var_2201;
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2205;
      }
      
      public function get roomResources() : String
      {
         return this.var_2211;
      }
      
      public function get unitPort() : int
      {
         return this.var_2149;
      }
      
      public function get worldId() : int
      {
         return this.var_2209;
      }
      
      public function set issueId(param1:int) : void
      {
         this.var_2208 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1345 = param1;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         this._reportedCategoryId = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1571 = param1;
      }
      
      public function set priority(param1:int) : void
      {
         this.var_2212 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2206 = param1;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         this.var_2202 = param1;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         this.var_2207 = param1;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1288 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1606 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         this.var_2203 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         this.var_2210 = param1;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         this.var_2204 = param1;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_909 = param1;
      }
      
      public function set roomType(param1:int) : void
      {
         this.var_1610 = param1;
      }
      
      public function set flatType(param1:String) : void
      {
         this.var_2201 = param1;
      }
      
      public function set flatId(param1:int) : void
      {
         this.var_315 = param1;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         this.var_2205 = param1;
      }
      
      public function set roomResources(param1:String) : void
      {
         this.var_2211 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         this.var_2149 = param1;
      }
      
      public function set worldId(param1:int) : void
      {
         this.var_2209 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1571) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
